import datetime
from django.http import HttpResponseForbidden, JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required 
from controlUsuario.decorators import paciente_required  # En controlUsuario.decorators creamos decoradores personalizados que verifiquen si el usuario tiene el atributo de paciente o usuario, y redirigirlo a una página de acceso denegado si intenta acceder a una vista que no le corresponde.
from hospital_personal.models import Especialidades,UsuarioXEspecialidadXServicioXrolesProfesionales,UsuarioXDepartamentoXJornadaXLugar,Turno,Consultas,Medicaciones,OrdenEstudio,Jorna_laboral,TurnoEstudio,ServicioDiagnostico,Lugar,ResultadoEstudio
from controlUsuario.models import Usuario
from controlUsuario.forms import FormularioRegistroPersonalizado
from .models import Paciente,MenorACargoDePaciente
from .forms import RegistrarMenorForm
from django.urls import reverse
from django.contrib import messages
from django.utils import timezone
from django.db.models import Q


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
    
    if request.method == "POST":
        estaBuscando = True
        especialidad_id = request.POST.get("especialidad")
        horario_turno = request.POST.get("horario")
        especialidad = Especialidades.objects.get(id=especialidad_id,permite_turno=True)
        
        # Filtrar los profesionales que están asociados con la especialidad seleccionada
        profesionales = UsuarioXEspecialidadXServicioXrolesProfesionales.objects.filter(especialidad=especialidad)

        # Filtrar los profesionales disponibles en el turno especificado
        profesionales_disponibles = UsuarioXDepartamentoXJornadaXLugar.objects.filter(
            usuario__in=profesionales.values('usuario'),
            jornada__turno=horario_turno
        ).values_list('usuario', flat=True).distinct()
        
        dias_disponibles = []
        for profesional in profesionales_disponibles:
            # Usamos la función de disponibilidad para obtener los días de trabajo de cada profesional
            disponibilidad = obtener_disponibilidad(profesional,horario_turno)
            dias_disponibles.append({
                "profesional": profesional,
                "disponibilidad": disponibilidad
            })
        
        return render(request, "turnos/sacarTurno.html", {
            "paciente": Paciente.objects.get(id=paciente_id),
            "menor":menor,
            "parentesco":parentesco,
            "especialidades": especialidades,
            "horariosDeConsultas":horariosDeConsultas,
            "especialidadSeleccionada": especialidad,
            "horarioSeleccionado": Jorna_laboral.objects.filter(turno=horario_turno).first(),
            "profesionales" : Usuario.objects.filter(id__in=profesionales_disponibles), # Si profesionales_disponibles es una lista de varios IDs de usuarios, puedes utilizar el operador __in para filtrar los usuarios que coincidan con cualquiera de esos IDs.
            "dias_disponibles": dias_disponibles,
            "estaBuscando":estaBuscando
        })
    
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
        
    estudios_solicitados = OrdenEstudio.objects.filter(consulta__turno__paciente__id=paciente_id, estado="pendiente")
    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_orden = request.GET.get("id_orden")
        orden = get_object_or_404(OrdenEstudio, id=id_orden)
        
        if id_orden:
            dias_disponibles = obtener_dias_disponibles_servicio()
            
            if orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=orden.consulta.turno.paciente).exists():  # Verificar que el turno pertenezca al paciente actual o a uno de sus menores a cargo
                return HttpResponseForbidden(render(request, "403.html")) 
            
            lugar_disponible = orden.tipo_estudio.servicio_diagnostico.lugar.filter(estado="disponible").first()
            if lugar_disponible:            
                data = {
                    "id_orden": orden.id,
                    "nombre_estudio": orden.tipo_estudio.nombre_estudio,
                    "id_servicio": orden.tipo_estudio.servicio_diagnostico.id,
                    "nombre_servicio": orden.tipo_estudio.servicio_diagnostico.nombre_servicio,
                    "lugar_id": lugar_disponible.id,
                    "lugar_nombre": lugar_disponible.nombre,
                    "lugar_tipo": lugar_disponible.get_tipo_display(),
                    "lugar_piso": lugar_disponible.piso,
                    "lugar_codigo": lugar_disponible.codigo,
                    "horario": "7:00 a 15:00",
                    "dias_disponibles": dias_disponibles
                }
                return JsonResponse(data)
            else:
                print("Lugar no disponible")
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
    
    if request.method == "POST":
        id_orden = request.POST.get("id_orden")
        id_lugar = request.POST.get("id_lugar")
        fecha_seleccionada = request.POST.get("fecha_seleccionada")
        servicio = request.POST.get("servicio")
        fecha_turno = datetime.datetime.strptime(fecha_seleccionada, "%Y-%m-%d").date()
        
        # Crear el nuevo turno
        try:
            nuevo_turno = TurnoEstudio(
                servicio_diagnostico= ServicioDiagnostico.objects.get(id=servicio),
                orden= OrdenEstudio.objects.get(id=id_orden),
                lugar= Lugar.objects.get(id=id_lugar),
                fecha_turno=fecha_turno,
            ) 
            nuevo_turno.save()
            print("Turno confirmado exitosamente.")
            
            orden = get_object_or_404(OrdenEstudio, id=id_orden)
            orden.estado = "realizado"
            orden.save()
            
            return redirect(reverse("turnoEstudioConfirmado", kwargs={"turno_id": nuevo_turno.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien creado
        except Exception as e:
            print(f"Error al guardar el turno: {e}")
    
    return render(request, "turnos/sacarTurnoEstudio.html", {"estudios": estudios_solicitados, "menor": menor, "parentesco": parentesco})

def obtener_disponibilidad(profesional_id, horario):
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
    
    # Paso 1: Obtener las jornadas laborales del profesional (usuario)
    jornadas = UsuarioXDepartamentoXJornadaXLugar.objects.filter(usuario_id=profesional_id)
    
    # Paso 2: Iterar sobre los próximos 60 días
    for i in range(1, 61):  # Ver los próximos 60 días
        dia = hoy + datetime.timedelta(days=i)
        dia_semana_ingles = dia.strftime("%A").lower()  # Nombre del día en inglés
        
        # Paso 3: Convertir el día en inglés a español
        dia_semana = dias_en_espanol.get(dia_semana_ingles, "")
        
        # Paso 3: Verificar si el profesional trabaja en este día
        for jornada in jornadas:
            if jornada.jornada.dia == dia_semana and jornada.jornada.turno == horario:
                # Si el profesional trabaja en este día, añadirlo a la lista
                dias_disponibles.append({
                    "fecha": dia,
                })
                break  # Ya encontramos que el profesional trabaja este día, no es necesario seguir buscando en las demás jornadas
            
    # Convertimos los días disponibles en un formato que pueda ser serializado a JSON
    dias_serializados = []
    for dia in dias_disponibles:
        dias_serializados.append({
            "fecha": dia["fecha"].strftime("%Y-%m-%d"),  # Formato de fecha serializable
        })

    return dias_serializados

def obtener_dias_disponibles_servicio():
    hoy = datetime.date.today()
    dias_disponibles = []

    for i in range(1, 31):  # Desde mañana hasta 30 días después
        dia = hoy + datetime.timedelta(days=i)
        if dia.weekday() < 5: 
            dias_disponibles.append({
                "fecha": dia.strftime("%Y-%m-%d")
            })

    return dias_disponibles

@paciente_required
@login_required
def confirmar_turno(request):
    if request.method == "POST":
        paciente_id = request.POST.get("paciente_id")
        especialidad_id = request.POST.get("especialidad_id")
        profesional_id = request.POST.get("profesional_id")
        horario_seleccionado = request.POST.get("horario_seleccionado")
        fecha_seleccionada = request.POST.get("fecha_seleccionada")
        motivo = request.POST.get("motivo")
        
        fecha_turno = datetime.datetime.strptime(fecha_seleccionada, "%Y-%m-%d").date()
        
        # Crear el nuevo turno
        try:
            nuevo_turno = Turno(
                paciente_id=paciente_id,
                especialidad_id=especialidad_id,
                profesional_id=profesional_id,
                horario_turno=horario_seleccionado,
                fecha_turno=fecha_turno,
                motivo=motivo,
                asistio=False  
            )
            nuevo_turno.save()
            print("Turno confirmado exitosamente.")
            return redirect(reverse("turnoConfirmado", kwargs={"turno_id": nuevo_turno.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien creado
        except Exception as e:
            print(f"Error al guardar el turno: {e}")

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
            disponibilidad = obtener_disponibilidad(turno.profesional_id,turno.horario_turno)
            dias_disponibles = [{
                "profesional": turno.profesional_id,
                "disponibilidad": disponibilidad
            }]
            return JsonResponse({
                "id": id_turno,
                "dias_disponibles": dias_disponibles
            })
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
        
    # Si es POST, procesar la reprogramación
    if request.method == "POST":
        turno = get_object_or_404(Turno, id=turno_id)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        hoy = timezone.now()
        fecha_seleccionada = request.POST.get("fecha_seleccionada")   
        fecha_turno = datetime.datetime.strptime(fecha_seleccionada, "%Y-%m-%d").date()
        turno_reprogramado = Turno.objects.get(id=turno_id)
        
        try:
            turno_reprogramado.fecha_creacion = hoy
            turno_reprogramado.fecha_turno = fecha_turno
            turno_reprogramado.save()
            print("Turno reprogramado exitosamente.")
            return redirect(reverse("turnoConfirmado", kwargs={"turno_id": turno_reprogramado.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien reprogramado
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
        turno = get_object_or_404(TurnoEstudio, id=id_turno)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.consulta.turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        if id_turno:
            dias_disponibles = obtener_dias_disponibles_servicio()
            data = {
                "dias_disponibles": dias_disponibles
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
        
    # Si es POST, procesar la reprogramación
    if request.method == "POST":
        turno = get_object_or_404(TurnoEstudio, id=turno_id)
        
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if turno.orden.consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=turno.orden.consulta.turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        hoy = timezone.now()
        fecha_seleccionada = request.POST.get("fecha_seleccionada")   
        fecha_turno = datetime.datetime.strptime(fecha_seleccionada, "%Y-%m-%d").date()
        turno_reprogramado = TurnoEstudio.objects.get(id=turno_id)
        
        try:
            turno_reprogramado.fecha_creacion = hoy
            turno_reprogramado.fecha_turno = fecha_turno
            turno_reprogramado.save()
            print("Turno reprogramado exitosamente.")
            return redirect(reverse("turnoEstudioConfirmado", kwargs={"turno_id": turno_reprogramado.id}))  # Redirigir a la vista de confirmación pasandole el id del turno recien creado
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
def medicacionyestudios(request):    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_consulta = request.GET.get("id")
        consulta = get_object_or_404(Consultas, id=id_consulta)
        paciente_actual = request.user.paciente    
        
        if not id_consulta:
            return JsonResponse({"error": "ID de consulta no proporcionado"}, status=400)
            
        # Verificar si el turno pertenece al paciente actual o a uno de sus menores a cargo
        if consulta.turno.paciente != paciente_actual and not paciente_actual.menores_a_cargo.filter(menor=consulta.turno.paciente).exists():
            return HttpResponseForbidden(render(request, "403.html"))
        
        medicamentos = Medicaciones.objects.filter(consulta_id=id_consulta)
        estudios = OrdenEstudio.objects.filter(consulta_id=id_consulta)
        
        data = {
            "medicacion": [],
            "estudio": []
        }
        
        for medicamento in medicamentos:
            data["medicacion"].append({
                "medicamento": medicamento.medicamento,
                "dosis": medicamento.dosis,
                "frecuencia": medicamento.frecuencia,
                "tiempo_uso": medicamento.tiempo_uso
            })
        
        for estudio in estudios:
            turno = TurnoEstudio.objects.filter(orden_id=estudio.id).first()  # Aseguramos obtener el primer turno
            if turno:
                resultado_estudio = ResultadoEstudio.objects.filter(turno_estudio=turno).first()
                pdf_url = resultado_estudio.archivo_pdf.url if resultado_estudio and resultado_estudio.archivo_pdf else ''
            else:
                pdf_url = ''  
            
            data["estudio"].append({
                "tipo_estudio": estudio.tipo_estudio.nombre_estudio,
                "motivo_estudio": estudio.motivo_estudio,
                "indicaciones": estudio.indicaciones,
                "fecha_solicitud": estudio.fecha_solicitud.strftime('%d/%m/%Y %H:%M') if estudio.fecha_solicitud else '',
                "estado": estudio.get_estado_display(),
                "pdf": pdf_url
            })
        
        return JsonResponse(data)


@paciente_required
@login_required
def registrarMenor(request):
    if request.method == "GET":
        return render(request, "gestionMenores/registroMenor.html",{"form":RegistrarMenorForm()})
    
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

