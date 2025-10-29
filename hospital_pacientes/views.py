import datetime
from django.http import HttpResponseForbidden, JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required 
from controlUsuario.decorators import paciente_required  # En controlUsuario.decorators creamos decoradores personalizados que verifiquen si el usuario tiene el atributo de paciente o usuario, y redirigirlo a una página de acceso denegado si intenta acceder a una vista que no le corresponde.
from hospital_personal.models import Especialidades,UsuarioRolProfesionalAsignado,UsuarioLugarTrabajoAsignado,Turno,Consultas,Medicaciones,OrdenEstudio,Jorna_laboral,TurnoEstudio,ServicioDiagnostico,Lugar,ResultadoEstudio
from hospital_personal.forms import FormSacarTurno,FormSacarTurnoEstudio
from controlUsuario.models import Usuario
from controlUsuario.forms import FormularioRegistroPersonalizado
from .models import Paciente,MenorACargoDePaciente
from .forms import RegistrarMenorForm
from django.urls import reverse
from django.utils import timezone
from django.db.models import Min
from django.contrib import messages

# Create your views here.

def mi_error_403(request, exception=None):
    return render(request, "403.html", status=403)

# def probar_404(request):
#     return render(request, "404.html", status=404)

@paciente_required
@login_required
def indexPaciente(request):
    return render(request, "indexPacientes.html")

@paciente_required
@login_required
def miCuenta(request):
    persona = request.user
    if request.method == "POST":
        form = FormularioRegistroPersonalizado(request.POST, instance=persona)
        if form.is_valid():
            form.save()
            return redirect("miCuenta") 
    else:
        form = FormularioRegistroPersonalizado(instance=persona)
    
    return render(request, "miCuenta.html", {"form":form}) 

@paciente_required
@login_required
def misTurnos(request):
    hoy = timezone.now().date() 
    paciente = request.user.paciente
    turnos_anteriores = Turno.objects.filter(paciente_id=paciente, fecha_turno__lt=hoy).prefetch_related('consulta').order_by("-fecha_turno") # fecha_turno__lt=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea antes de hoy y con el orden_by ordenamos del más reciente al más viejo.
    turnos_futuros = Turno.objects.filter(paciente_id=paciente, fecha_turno__gte=hoy).order_by("fecha_turno") # fecha_turno__gte=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea hoy o en el futuro y con el orden_by ordenamos del más cercano al más lejos.
    
    turnosEstudios_anteriores = TurnoEstudio.objects.filter(orden__consulta__turno__paciente_id=paciente, fecha_turno__lt=hoy).order_by("-fecha_turno") # fecha_turno__lt=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea antes de hoy y con el orden_by ordenamos del más reciente al más viejo.
    turnosEstudios_futuros = TurnoEstudio.objects.filter(orden__consulta__turno__paciente_id=paciente, fecha_turno__gte=hoy).order_by("fecha_turno") # fecha_turno__gte=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea hoy o en el futuro y con el orden_by ordenamos del más cercano al más lejos.
    return render(request, "turnos/verTurnos.html",{"turnos_anteriores":turnos_anteriores,"turnos_futuros":turnos_futuros, "turnosEstudios_futuros":turnosEstudios_futuros, "turnosEstudios_anteriores":turnosEstudios_anteriores}) 

@paciente_required
@login_required
def susTurnos(request, id_paciente):
    hoy = timezone.now().date() 
    adulto = request.user.paciente
    
    if not adulto.menores_a_cargo.filter(menor_id=id_paciente).exists():  # Si el usuario actual no tiene a cargo al menor que tiene el id que se pasa:
        return HttpResponseForbidden(render(request, "403.html"))  
    
    paciente = Paciente.objects.get(id=id_paciente) 
    turnos_anteriores = Turno.objects.filter(paciente_id=paciente, fecha_turno__lt=hoy).order_by("-fecha_turno") # fecha_turno__lt=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea antes de hoy y con el orden_by ordenamos del más reciente al más viejo.
    turnos_futuros = Turno.objects.filter(paciente_id=paciente, fecha_turno__gte=hoy).order_by("fecha_turno") # fecha_turno__gte=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea hoy o en el futuro y con el orden_by ordenamos del más cercano al más lejos.
    
    turnosEstudios_anteriores = TurnoEstudio.objects.filter(orden__consulta__turno__paciente_id=paciente, fecha_turno__lt=hoy).order_by("-fecha_turno") # fecha_turno__lt=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea antes de hoy y con el orden_by ordenamos del más reciente al más viejo.
    turnosEstudios_futuros = TurnoEstudio.objects.filter(orden__consulta__turno__paciente_id=paciente, fecha_turno__gte=hoy).order_by("fecha_turno") # fecha_turno__gte=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea hoy o en el futuro y con el orden_by ordenamos del más cercano al más lejos.
    
    return render(request, "turnos/verTurnos.html",{"turnos_anteriores":turnos_anteriores,"turnos_futuros":turnos_futuros, "turnosEstudios_futuros":turnosEstudios_futuros, "turnosEstudios_anteriores":turnosEstudios_anteriores}) 


@paciente_required
@login_required
def seleccionarTurno(request,paciente_id):
    if request.user.paciente.id == paciente_id: # verifica si el usuario autenticado está intentando sacar turno para sí mismo
        paciente = get_object_or_404(Paciente, id=paciente_id)
    else:
        menores_a_cargo = request.user.paciente.menores_a_cargo.all()  # Obtiene los menores a cargo del paciente autenticado
        if not menores_a_cargo.filter(menor_id=paciente_id).exists(): # Verifica si el paciente_id no pertenece a alguno de esos menores
            return HttpResponseForbidden(render(request, "403.html"))
        else:
            menor = menores_a_cargo.get(menor_id=paciente_id)
            paciente = menor.menor
    
    orden_pendiente = OrdenEstudio.objects.filter(consulta__turno__paciente=paciente, estado="pendiente")
    return render(request, "turnos/seleccionarTipoTurno.html",{"orden_pendiente":orden_pendiente, "paciente":paciente}) 

@paciente_required
@login_required
def sacarTurno(request, paciente_id):
    parentesco = ""
    menor = False
    if request.user.paciente.id != paciente_id: # verifica si el usuario autenticado está intentando sacar turno para sí mismo
        menores_a_cargo = request.user.paciente.menores_a_cargo.all()  # Obtiene los menores a cargo del paciente autenticado
        if not menores_a_cargo.filter(menor_id=paciente_id).exists(): # Verifica si el paciente_id no pertenece a alguno de esos menores
            return HttpResponseForbidden(render(request, "403.html"))
        else:
            menor = menores_a_cargo.get(menor_id=paciente_id)
            parentesco = f"para {menor.menor.persona.get_full_name()} ({menor.get_parentesco_display()})"
        
    especialidades = Especialidades.objects.filter(permite_turno=True)
    dia = Jorna_laboral.objects.filter(turno="dia").first()
    tarde = Jorna_laboral.objects.filter(turno="tarde").first()
    horariosDeConsultas = [dia, tarde]
    
    if request.method == "GET":
        request.session.pop(f"especialidad_seleccionada_id_{paciente_id}", None)
        request.session.pop(f"horario_seleccionado_{paciente_id}", None)
    
    if request.method == "POST":
        tipo_form = request.POST.get("tipo_form")
        
        if tipo_form == "formSeleccionEspecialidad":
            estaBuscando = True
            especialidad_id = request.POST.get("especialidad")
            horario_turno = request.POST.get("horario")
            
            try:
                especialidad = Especialidades.objects.get(id=especialidad_id, permite_turno=True)
            except Especialidades.DoesNotExist:
                messages.error(request, "La especialidad seleccionada no es válida.")
                return render(request, "turnos/sacarTurno.html", {
                    "error": "Especialidad inválida",
                    "especialidades": especialidades,
                    "menor": menor,
                    "parentesco": parentesco,
                    "horariosDeConsultas": horariosDeConsultas
                })     
            
            # Guardar datos en sesión para validaciones posteriores
            request.session[f"especialidad_seleccionada_id_{paciente_id}"] = especialidad.id
            request.session[f"horario_seleccionado_{paciente_id}"] = horario_turno
            
            
            # Filtrar los profesionales que están asociados con la especialidad seleccionada
            profesionales = UsuarioRolProfesionalAsignado.objects.filter(rol_profesional__especialidad=especialidad)
            
            subConsulta = (  # Subconsulta que trae un registro de cada usuario.
                UsuarioLugarTrabajoAsignado.objects.filter(
                    usuario__in=profesionales.values('usuario'),
                    jornada__turno=horario_turno
                )
                .values('usuario')
                .annotate(min_id=Min('id'))
                .values('min_id')
            )
            
            profesionales_disponibles = UsuarioLugarTrabajoAsignado.objects.filter(id__in=subConsulta)
                    
            dias_disponibles = []
            formularios = [] 
            paciente = Paciente.objects.get(id=paciente_id)
            
            for profesional in profesionales_disponibles:
                disponibilidad = obtener_disponibilidad(profesional.usuario.id, horario_turno,especialidad.id,paciente.id)
                dias_disponibles.append({
                    "profesional": profesional.usuario.id,
                    "disponibilidad": disponibilidad
                })
                
                form = FormSacarTurno(initial={
                    'horario_turno': horario_turno,
                    'especialidad': especialidad.id,
                    'profesional': profesional.usuario.id,
                    'paciente': paciente.id,
                    'lugar': profesional.lugar.id
                })
                formularios.append({
                    "profesional": profesional,
                    "form": form
                })
            
            return render(request, "turnos/sacarTurno.html", {
                "estaBuscando":estaBuscando,
                "formularios" : formularios,
                "dias_disponibles": dias_disponibles,
                "menor":menor,
                "parentesco":parentesco,
                "especialidades": especialidades,
                "especialidadSeleccionada": especialidad,
                "horariosDeConsultas":horariosDeConsultas,
                "horarioSeleccionado": Jorna_laboral.objects.filter(turno=horario_turno).first()
            })
            
        elif tipo_form == "formSeleccionProfesional":
            form = FormSacarTurno(request.POST)
            
            try:
                paciente_form_id = int(request.POST.get("paciente"))
            except ValueError:
                response = render(request, "403.html", {
                    "mensaje": "El id del paciente no existe"
                })
                response.status_code = 403
                return response              
            try:
                profesional_form_id = int(request.POST.get("profesional"))
            except ValueError:
                response = render(request, "403.html", {
                    "mensaje": "El id del profesional no existe"
                })
                response.status_code = 403
                return response              
            try:
                especialidad_form_id = int(request.POST.get("especialidad"))
            except ValueError:
                response = render(request, "403.html", {
                    "mensaje": "El id de la especialidad no existe"
                })
                response.status_code = 403
                return response     
            try:
                lugar_form_id = int(request.POST.get("lugar"))
            except ValueError:
                response = render(request, "403.html", {
                    "mensaje": "El id del lugar no existe"
                })
                response.status_code = 403
                return response     
                        
            fecha_turno_form = request.POST.get("fecha_turno")
            horario_turno_form = request.POST.get("horario_turno")         

            if paciente_form_id != paciente_id:
                response = render(request, "403.html", {
                    "mensaje": "No podés reservar un turno para otro paciente."
                })
                response.status_code = 403
                return response

            # Validar especialidad y coincidencia con la búsqueda
            try:
                especialidad_form = Especialidades.objects.get(id=especialidad_form_id, permite_turno=True)
            except Especialidades.DoesNotExist:
                response = render(request, "403.html", {
                    "mensaje": "Especialidad inválida o no disponible."
                })
                response.status_code = 403
                return response            

            especialidad_sesion = request.session.get(f"especialidad_seleccionada_id_{paciente_id}")
            if not especialidad_sesion or especialidad_sesion != especialidad_form.id:
                response = render(request, "403.html", {
                    "mensaje": "La especialidad no coincide con la seleccionada inicialmente."
                })
                response.status_code = 403
                return response                  

            # Validar horario
            horario_sesion = request.session.get(f"horario_seleccionado_{paciente_id}")
            if not horario_sesion or horario_turno_form != horario_sesion:
                response = render(request, "403.html", {
                    "mensaje": "El horario no coincide con el seleccionado inicialmente."
                })
                response.status_code = 403
                return response             

            # Validar profesional y su jornada
            try:
                profesional = UsuarioLugarTrabajoAsignado.objects.select_related("jornada", "usuario", "lugar").filter(usuario_id=profesional_form_id).first()
            except UsuarioLugarTrabajoAsignado.DoesNotExist:
                response = render(request, "403.html", {
                    "mensaje": "Profesional inválido o no encontrado."
                })
                response.status_code = 403
                return response               
            

            if not UsuarioRolProfesionalAsignado.objects.filter(usuario=profesional.usuario, rol_profesional__especialidad=especialidad_form).exists():
                response = render(request, "403.html", {
                    "mensaje": "El profesional no pertenece a la especialidad seleccionada."
                })
                response.status_code = 403
                return response               

            if profesional.lugar.id != lugar_form_id :
                response = render(request, "403.html", {
                    "mensaje": "El lugar no coincide con donde trabaja el profesional."
                })
                response.status_code = 403
                return response             

            if profesional.jornada.turno != horario_turno_form :
                response = render(request, "403.html", {
                    "mensaje": "El horario no coincide con la jornada del profesional."
                })
                response.status_code = 403
                return response             

            # Validar fecha disponible
            disponibilidad = obtener_disponibilidad(profesional.usuario.id, horario_turno_form,especialidad_form.id,paciente.id)
            fechas_validas = [dia["fecha"] for dia in disponibilidad]
            if fecha_turno_form not in fechas_validas:
                response = render(request, "403.html", {
                    "mensaje": "Fecha de turno no válida para este profesional."
                })
                response.status_code = 403
                return response               

            if form.is_valid():
                turno = form.save()

                request.session.pop(f"especialidad_seleccionada_id_{paciente_id}", None)
                request.session.pop(f"horario_seleccionado_{paciente_id}", None)

                return redirect(reverse("turnoConfirmado", kwargs={"turno_id": turno.id}))
            else:
                messages.error(request, "Ha ocurrido un error al guardar el turno. Intentelo de nuevo")
    
    return render(request, "turnos/sacarTurno.html", {"especialidades": especialidades, "menor":menor,"parentesco":parentesco,"horariosDeConsultas":horariosDeConsultas})

@paciente_required
@login_required
def sacarTurnoEstudio(request, paciente_id):
    paciente_actual = request.user.paciente
    parentesco = ""
    menor = False
    if request.user.paciente.id != paciente_id: # verifica si el usuario autenticado está intentando sacar turno para sí mismo
        menores_a_cargo = request.user.paciente.menores_a_cargo.all()  # Obtiene los menores a cargo del paciente autenticado
        if not menores_a_cargo.filter(menor_id=paciente_id).exists(): # Verifica si el paciente_id no pertenece a alguno de esos menores
            return HttpResponseForbidden(render(request, "403.html"))
        else:
            menor = menores_a_cargo.get(menor_id=paciente_id)
            parentesco = f"para {menor.menor.persona.get_full_name()} ({menor.get_parentesco_display()})"
            
    estudios_solicitados = OrdenEstudio.objects.filter(paciente=paciente_id, estado="pendiente")
    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_orden = request.GET.get("id_orden")
        orden = get_object_or_404(OrdenEstudio, id=id_orden)
        
        if id_orden:            
            if orden.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=orden.paciente).exists():  # Verificar que el turno pertenezca al paciente actual o a uno de sus menores a cargo
                return HttpResponseForbidden(render(request, "403.html")) 
            
            dias_disponibles, lugarDisponible = obtener_dias_disponibles_servicio(orden.tipo_estudio.servicio_diagnostico.id,orden.paciente.id,orden.tipo_estudio.id)
            
            data = {
                "id_orden": orden.id,
                "nombre_estudio": orden.tipo_estudio.nombre_estudio,
                "id_servicio": orden.tipo_estudio.servicio_diagnostico.id,
                "nombre_servicio": orden.tipo_estudio.servicio_diagnostico.nombre_servicio,
                "dias_disponibles": dias_disponibles
            }

            if lugarDisponible and dias_disponibles:
                data.update({
                    "lugar_id": lugarDisponible.id,
                    "lugar_nombre": lugarDisponible.nombre,
                    "lugar_piso": lugarDisponible.piso,
                    "lugar_sala": lugarDisponible.sala,
                    "horario": "7:00 a 15:00",
                    "disponible": True
                })
            else:
                data.update({
                    "lugar_disponible": False,
                    "mensaje": "No hay días disponibles para este servicio. Por favor, inténtelo nuevamente mañana.",
                    "disponible": False
                })
            
            return JsonResponse(data)
        
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
    
    if request.method == "POST":
        form = FormSacarTurnoEstudio(request.POST)

        try:
            orden_form_id = int(request.POST.get("orden"))
        except ValueError:
            response = render(request, "403.html", {
                "mensaje": "El numero de orden es incorrecto"
            })
            response.status_code = 403
            return response    
        try:
            lugar_form_id = int(request.POST.get("lugar"))
        except ValueError:
            response = render(request, "403.html", {
                "mensaje": "Lugar no disponible"
            })
            response.status_code = 403
            return response                    
        try:
            servicio_form_id = int(request.POST.get("servicio_diagnostico"))
        except ValueError:
            response = render(request, "403.html", {
                "mensaje": "Servicio de diagnostico no disponible"
            })
            response.status_code = 403
            return response                    
        
        fecha_turno_form = request.POST.get("fecha_turno")
        horario_turno_form = request.POST.get("horario_turno")  
        
        orden = OrdenEstudio.objects.get(pk=orden_form_id)    
        
        if orden.paciente.id != paciente_id:
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno para otro paciente."
            })
            response.status_code = 403
            return response          
        
        if orden.tipo_estudio.servicio_diagnostico.id != servicio_form_id:
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno en un servicio de diagnostico diferente."
            })
            response.status_code = 403
            return response          
        
        if not orden.tipo_estudio.servicio_diagnostico.lugar.filter(id=lugar_form_id).exists():
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno en un lugar no capacitado para ese estudio."
            })
            response.status_code = 403
            return response          
        
        if horario_turno_form != "dia":
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno en un horario diferente."
            })
            response.status_code = 403
            return response     
        
        disponibilidad, lugar = obtener_dias_disponibles_servicio(servicio_form_id,paciente_id,orden.tipo_estudio.id)
        fechas_validas = [dia["fecha"] for dia in disponibilidad]
        if fecha_turno_form not in fechas_validas:
            response = render(request, "403.html", {
                "mensaje": "Fecha de turno no disponible para este estudio."
            })
            response.status_code = 403
            return response       
        
        if form.is_valid():
            turno = form.save()
            orden.estado = "realizado"
            orden.save()
            return redirect(reverse("turnoEstudioConfirmado", kwargs={"turno_id": turno.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien creado
        else:
            messages.error(request, "Ha ocurrido un error al guardar el turno. Intentelo de nuevo")        
        
    return render(request, "turnos/sacarTurnoEstudio.html", {"estudios": estudios_solicitados, "menor": menor, "parentesco": parentesco,"form":FormSacarTurnoEstudio()})

def obtener_disponibilidad(profesional_id, horario,especialidad_id,paciente_id):
    hoy = datetime.date.today()
    dias_disponibles = []
    
    dias_en_espanol = {
        "monday": "lunes",
        "tuesday": "martes",
        "wednesday": "miercoles",
        "thursday": "jueves",
        "friday": "viernes",
        "saturday": "sabado",
        "sunday": "domingo"
    }
    
    #Obtener las jornadas laborales del profesional 
    jornadas = UsuarioLugarTrabajoAsignado.objects.filter(usuario_id=profesional_id,rolProfesionalAsignado__rol_profesional__especialidad__id=especialidad_id)
    especialidad = get_object_or_404(Especialidades, pk=especialidad_id)
    limite = especialidad.capacidad_diaria
    
    # Iterar sobre los próximos 60 días
    for i in range(1, 61):  # Ver los próximos 60 días
        dia = hoy + datetime.timedelta(days=i) # Obtengo la fecha
        dia_semana_ingles = dia.strftime("%A").lower()  # Obtengo el nombre del dia segun la fecha
        dia_semana = dias_en_espanol.get(dia_semana_ingles, "") # Convertir el nombre del día en inglés a español
        
        # Verificar si el profesional trabaja en este día
        for jornada in jornadas:
            if jornada.jornada.dia == dia_semana and jornada.jornada.turno == horario:  # Si el profesional trabaja en este día y horario
                if not Turno.objects.filter(fecha_turno=dia, paciente_id=paciente_id,especialidad=especialidad,horario_turno=horario).exists():
                    if Turno.objects.filter(fecha_turno=dia,especialidad=especialidad,profesional=profesional_id,lugar=jornada.lugar).count() < limite:  # Si hay menos de limite de capacidad de cupos diarios entonces lo agregamos a las fechas disponibles
                        dias_disponibles.append({
                            "fecha": dia
                        })
                        break  # Ya encontramos que el profesional trabaja este día, no es necesario seguir buscando en las demás jornadas
            
    # Convertimos los días disponibles en un formato que pueda ser serializado a JSON
    dias_serializados = []
    for dia in dias_disponibles:
        dias_serializados.append({
            "fecha": dia["fecha"].strftime("%Y-%m-%d"),  # Formato de fecha serializable
        })

    return dias_serializados


def obtener_dias_disponibles_servicio(servicio_id,paciente_id,estudio_id):
    hoy = datetime.date.today()
    dias_disponibles = []
    servicio_diagnostico = get_object_or_404(ServicioDiagnostico, pk=servicio_id)
    limite = servicio_diagnostico.capacidad_diaria
    lugaresDisponibles = servicio_diagnostico.lugar.all()
    lugarDisponible = None
    for lugar in lugaresDisponibles:
        if TurnoEstudio.objects.filter(servicio_diagnostico=servicio_diagnostico,lugar=lugar).count() < limite:
            lugarDisponible = lugar
            break
        
    for i in range(1, 31):  # Desde mañana hasta 30 días después
        dia = hoy + datetime.timedelta(days=i)
        if dia.weekday() < 5: 
            if lugarDisponible is not None:
                if TurnoEstudio.objects.filter(fecha_turno=dia,servicio_diagnostico=servicio_diagnostico,lugar=lugarDisponible).count() < limite:  # Si hay menos de limite de capacidad de cupos diarios entonces lo agregamos a las fechas disponibles
                    if not TurnoEstudio.objects.filter(fecha_turno=dia, orden__paciente_id=paciente_id,orden__tipo_estudio_id=estudio_id).exists():                    
                        dias_disponibles.append({
                            "fecha": dia
                        })
    
    # Convertimos los días disponibles en un formato que pueda ser serializado a JSON
    dias_serializados = []
    for dia in dias_disponibles:
        dias_serializados.append({
            "fecha": dia["fecha"].strftime("%Y-%m-%d"),  # Formato de fecha serializable
        })

    return dias_serializados, lugarDisponible


@paciente_required
@login_required
def turno_confirmado(request, turno_id):
    turno = get_object_or_404(Turno, id=turno_id)
    paciente_actual = request.user.paciente

    if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists() or turno.estado != "pendiente":  # Verificar que el turno pertenezca al paciente actual o a uno de sus menores a cargo
        return HttpResponseForbidden(render(request, "403.html"))    
    
    if turno.estado != "pendiente":
        return HttpResponseForbidden(render(request, "403.html"))   
    
    es_menor = turno.paciente != request.user.paciente
    return render(request, "turnos/turnoConfirmado.html", {"datos_turno":turno, "is_menor":es_menor})

@paciente_required
@login_required
def turno_estudio_confirmado(request, turno_id):
    turnoEstudio = get_object_or_404(TurnoEstudio, id=turno_id)
    paciente_actual = request.user.paciente

    if turnoEstudio.orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turnoEstudio.orden.consulta.turno.paciente).exists():  # Verificar que el turno pertenezca al paciente actual o a uno de sus menores a cargo
        return HttpResponseForbidden(render(request, "403.html"))    
    
    if turnoEstudio.estado != "pendiente":
        return HttpResponseForbidden(render(request, "403.html"))    
    
    es_menor = turnoEstudio.orden.consulta.turno.paciente != request.user.paciente
    return render(request, "turnos/turnoConfirmado.html", {"datos_turno":turnoEstudio, "is_menor":es_menor, "turnoEstudio":True})

@paciente_required
@login_required
def reprogramarTurno(request, turno_id):
    paciente_actual = request.user.paciente
    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_turno = request.GET.get("id")
        turno = get_object_or_404(Turno, id=id_turno)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        if id_turno:
            disponibilidad = obtener_disponibilidad(turno.profesional_id,turno.horario_turno,turno.especialidad.id,turno.paciente.id)
            dias_disponibles = [{
                "disponibilidad": disponibilidad
            }]
            return JsonResponse({
                "id": id_turno,
                "profesional": f"{turno.profesional.persona.get_full_name()} - DNI: {turno.profesional.persona.dni}",
                "matricula": turno.profesional.numero_matricula,
                "sexo": turno.profesional.persona.sexo,
                "horario": "07:00 a 15:00" if turno.horario_turno == "dia" else "15:00 a 23:00" if turno.horario_turno == "tarde" else "Sin horario",
                "lugar": f"{turno.lugar.nombre} <br> <strong>(Piso: {turno.lugar.piso} - N° Sala: {turno.lugar.sala})</strong>",
                "fecha": turno.fecha_turno,
                "dias_disponibles": dias_disponibles
            })
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
        
    if request.method == "POST":
        turno = get_object_or_404(Turno, id=turno_id)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        hoy = timezone.now()
        fecha_seleccionada = request.POST.get("fecha_seleccionada")   
        
        # Validar fecha disponible
        disponibilidad = obtener_disponibilidad(turno.profesional.id, turno.horario_turno,turno.especialidad.id,turno.paciente.id)
        fechas_validas = [dia["fecha"] for dia in disponibilidad]
        if fecha_seleccionada not in fechas_validas:
            response = render(request, "403.html", {
                "mensaje": "Fecha de turno no válida para este profesional."
            })
            response.status_code = 403
            return response           
        
        try:
            turno.fecha_creacion = hoy
            turno.fecha_turno = fecha_seleccionada
            turno.save()
            return redirect(reverse("turnoConfirmado", kwargs={"turno_id": turno.id})) 
        except Exception as e:
            print(f"Error al reprogramar el turno: {e}")
    
    return HttpResponseForbidden(render(request, "403.html"))


@paciente_required
@login_required
def cancelarTurno(request, turno_id):
    turno = get_object_or_404(Turno, id=turno_id)
    paciente_actual = request.user.paciente
    
    # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
    if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists():
        return HttpResponseForbidden(render(request, "403.html"))
    
    if turno.paciente == paciente_actual:  # Si el turno es del paciente actual
        if request.method == 'GET':
            return redirect("misTurnos")
        
        if request.method == 'POST':
            turno.estado = "cancelado"
            turno.asistio = False
            turno.save()
            return redirect("misTurnos")
    
    menor_turno = paciente_actual.menores_a_cargo.filter(menor=turno.paciente).first() # Obtener el turno del menor relacionado
    if menor_turno: # Si el turno es de un menor a cargo
        if request.method == 'GET':
            return redirect(reverse("susTurnos", kwargs={"id_paciente": menor_turno.menor.id}))
    
        if request.method == 'POST':
            turno.estado = "cancelado"
            turno.asistio = False
            turno.save()
            return redirect(reverse("susTurnos", kwargs={"id_paciente": menor_turno.menor.id}))

@paciente_required
@login_required
def reprogramarTurnoEstudio(request, turno_id):
    paciente_actual = request.user.paciente
    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_turno = request.GET.get("id")
        turno = get_object_or_404(TurnoEstudio, pk=id_turno)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.orden.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        if id_turno:  
            dias_disponibles, lugarDisponible = obtener_dias_disponibles_servicio(turno.servicio_diagnostico.id,turno.orden.paciente.id,turno.orden.tipo_estudio.id)
            
            data = {
                "id_orden": turno.orden.id,
                "nombre_estudio": turno.orden.tipo_estudio.nombre_estudio,
                "nombre_servicio": turno.orden.tipo_estudio.servicio_diagnostico.nombre_servicio,
                "fecha": turno.fecha_turno,
                "dias_disponibles": dias_disponibles
            }

            if lugarDisponible and dias_disponibles:
                data.update({
                    "lugar_id": lugarDisponible.id,
                    "lugar_nombre": lugarDisponible.nombre,
                    "lugar_piso": lugarDisponible.piso,
                    "lugar_sala": lugarDisponible.sala,
                    "horario": "7:00 a 15:00",
                    "disponible": True
                })
            else:
                data.update({
                    "lugar_disponible": False,
                    "mensaje": "No hay días disponibles para este servicio. Por favor, inténtelo nuevamente mañana.",
                    "disponible": False
                })
            
            return JsonResponse(data)
        
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
    
    if request.method == "POST":
        turno = get_object_or_404(TurnoEstudio, pk=turno_id)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.orden.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        hoy = timezone.now()
        fechaSeleccionada = request.POST.get("fecha_seleccionadaEstudio") 
        try:        
            lugarSeleccionado_id = int(request.POST.get("lugar"))
        except ValueError:
            response = render(request, "403.html", {
                "mensaje": "Lugar no disponible."
            })
            response.status_code = 403
            return response                
        
        disponibilidad, lugar = obtener_dias_disponibles_servicio(turno.servicio_diagnostico.id,turno.orden.paciente.id,turno.orden.tipo_estudio.id)
        fechas_validas = [dia["fecha"] for dia in disponibilidad]
        if fechaSeleccionada not in fechas_validas:
            response = render(request, "403.html", {
                "mensaje": "Fecha de turno no disponible para este estudio."
            })
            response.status_code = 403
            return response              
        
        if not turno.orden.tipo_estudio.servicio_diagnostico.lugar.filter(id=lugarSeleccionado_id).exists():
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno en un lugar no capacitado para ese estudio."
            })
            response.status_code = 403
            return response         
        
        lugar = Lugar.objects.get(pk=lugarSeleccionado_id)   
        print(lugar)
        if TurnoEstudio.objects.filter(fecha_turno=fechaSeleccionada,servicio_diagnostico=turno.servicio_diagnostico,lugar=lugar).count() >= turno.servicio_diagnostico.capacidad_diaria:
            response = render(request, "403.html", {
                "mensaje": "No podés reservar un turno en un lugar sin disponibilidad."
            })
            response.status_code = 403
            return response                   
        try:
            turno.fecha_creacion = hoy
            turno.fecha_turno = fechaSeleccionada
            turno.lugar = lugar
            turno.save()
            return redirect(reverse("turnoEstudioConfirmado", kwargs={"turno_id": turno.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien creado
        except Exception as e:
            print(f"Error al reprogramar el turno: {e}")
    
    return HttpResponseForbidden(render(request, "403.html"))

@paciente_required
@login_required
def cancelarTurnoEstudio(request, turno_id):
    turno = get_object_or_404(TurnoEstudio, id=turno_id)
    paciente_actual = request.user.paciente
    
    # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
    if turno.orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.consulta.turno.paciente).exists():
        return HttpResponseForbidden(render(request, "403.html"))
    
    if turno.orden.consulta.turno.paciente == paciente_actual:  # Si el turno es del paciente actual
        if request.method == 'GET':
            return redirect("misTurnos")
        
        if request.method == 'POST':
            turno.estado = "cancelado"
            turno.save()
            return redirect("misTurnos")
    
    menor_turno = paciente_actual.menores_a_cargo.filter(menor=turno.orden.consulta.turno.paciente).first() # Obtener el turno del menor relacionado
    if menor_turno: # Si el turno es de un menor a cargo
        if request.method == 'GET':
            return redirect(reverse("susTurnos", kwargs={"id_paciente": menor_turno.menor.id}))
    
        if request.method == 'POST':
            turno.estado = "cancelado"
            turno.save()
            return redirect(reverse("susTurnos", kwargs={"id_paciente": menor_turno.menor.id}))

@paciente_required
@login_required
def miHistorial(request):
    if request.method == "GET":
        # Traer consultas, medicaciones y estudios relacionados de forma eficiente
        consultas = Consultas.objects.filter(turno__paciente=request.user.paciente).prefetch_related('estudios', 'medicaciones')  # trae todas las medicaciones y estudios asociados a las consultas que hayas filtrado
        estudios = OrdenEstudio.objects.filter(consulta__turno__paciente = request.user.paciente)
        medicamentos = Medicaciones.objects.filter(consulta__turno__paciente = request.user.paciente)
        return render(request, "historialClinico.html",{"allConsultas":consultas, "allEstudios":estudios, "allMedicamentos":medicamentos})

@paciente_required
@login_required
def suHistorial(request, id_paciente):
    adulto = request.user.paciente
    
    if not adulto.menores_a_cargo.filter(menor_id=id_paciente).exists():  # Si el usuario actual no tiene a cargo al menor que tiene el id que se pasa:
        return HttpResponseForbidden(render(request, "403.html"))  
    
    paciente = Paciente.objects.get(id=id_paciente) 
    consultas = Consultas.objects.filter(turno__paciente=paciente).prefetch_related('estudios', 'medicaciones').order_by("fecha")  # trae todas las medicaciones y estudios asociados a las consultas que hayas filtrado
    estudios = OrdenEstudio.objects.filter(consulta__turno__paciente = paciente)
    medicamentos = Medicaciones.objects.filter(consulta__turno__paciente = paciente)
    return render(request, "historialClinico.html",{"allConsultas":consultas, "allEstudios":estudios, "allMedicamentos":medicamentos})

@paciente_required
@login_required
def consultaEspecifica(request, id_turno):
    turno = get_object_or_404(Turno, id=id_turno)
    paciente_actual = request.user.paciente
    
    # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
    if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists():
        return HttpResponseForbidden(render(request, "403.html"))
    
    if request.method == "POST":
        consulta = Consultas.objects.filter(turno_id=turno.id,turno__paciente=turno.paciente).prefetch_related('estudios', 'medicaciones').first() # trae todas las medicaciones y estudios asociados a las consultas que hayas filtrado
        return render(request,"historialClinico.html",{"consultaEspecifica":consulta})

@paciente_required
@login_required
def resultadoEstudioEspecifico(request, id_turno):
    turno = get_object_or_404(TurnoEstudio, id=id_turno)
    paciente_actual = request.user.paciente
    
    # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
    if turno.orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.consulta.turno.paciente).exists():
        return HttpResponseForbidden(render(request, "403.html"))
    
    if request.method == "POST":
        resultadoEstudio = ResultadoEstudio.objects.get(turno_estudio_id=turno.id)
        return render(request,"historialClinico.html",{"resultadoEstudioEspecifico":resultadoEstudio})


@paciente_required
@login_required
def registrarMenor(request):
    adulto = request.user.paciente
    menores_relaciones = adulto.menores_a_cargo.select_related("menor__persona")
    if request.method == "GET":
        return render(request, "gestionMenores/registroMenor.html",{"form":RegistrarMenorForm(),"haveMenores":menores_relaciones})
    
    if request.method == "POST":
        form = RegistrarMenorForm(request.POST, adulto=request.user.paciente)
        if form.is_valid():
            form.save()
            return redirect("gestionMenores")
        else:
            return render(request, "gestionMenores/registroMenor.html", {"form": form})
        

@paciente_required
@login_required
def gestionMenores(request):
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_menor = request.GET.get("id")
        if id_menor:
            menor = get_object_or_404(MenorACargoDePaciente, menor_id=id_menor)
            data = {
                "id": id_menor,
                "dni": menor.menor.persona.dni,
                "nombre": menor.menor.persona.first_name,
                "apellido": menor.menor.persona.last_name,
                "sexo": menor.menor.persona.sexo,
                "fecha_nacimiento": menor.menor.persona.fecha_nacimiento,
                "parentesco": menor.parentesco
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400) 
    
    if request.method == "POST":
        id_menor = request.POST.get("id_menor")  
        if id_menor:
            menor = get_object_or_404(MenorACargoDePaciente, menor_id=id_menor)
            persona = menor.menor.persona  # Obtenemos la persona asociada al menor
            form = RegistrarMenorForm(request.POST, instance=persona, adulto=request.user.paciente)
            if form.is_valid():
                form.save()  
                return redirect("gestionMenores")
        else:
            print("F")
            return redirect("gestionMenores")
        
    adulto = request.user.paciente
    menores_relaciones = adulto.menores_a_cargo.select_related("menor__persona")
    return render(request, "gestionMenores/gestionMenores.html",{"menores_relaciones": menores_relaciones,"form":RegistrarMenorForm()})  

