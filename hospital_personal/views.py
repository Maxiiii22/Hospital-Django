from collections import defaultdict
from django.utils import timezone
from django.contrib import messages
from django.http import HttpResponseForbidden, HttpResponseNotFound, JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required 
from controlUsuario.decorators import personal_required # En controlUsuario.decorators creamos decoradores personalizados que verifiquen si el usuario tiene el atributo de paciente o usuario, y redirigirlo a una página de acceso denegado si intenta acceder a una vista que no le corresponde.
from .models import UsuarioXDepartamentoXJornadaXLugar,UsuarioXEspecialidadXServicioXrolesProfesionales,Departamento,Especialidades,Turno,Consultas,Medicaciones,OrdenEstudio,EstudiosDiagnosticos,TurnoEstudio,ResultadoEstudio,ResultadoImagen,ServicioDiagnostico,Lugar,PlantillaEstudio
from controlUsuario.models import Usuario,TiposUsuarios,RolesProfesionales
from hospital_pacientes.models import Paciente
from controlUsuario.forms import FormularioRegistroDePersonal,FormularioActualizarPassword
from .forms import FormEspecialidades,FormDepartamentos,FormTiposUsuarios,FormConsulta,MedicacionesFormSet,EstudiosFormSet,ResultadoEstudioForm,ResultadoImagenForm,FormularioAsignaciones,FormularioLugarTrabajo,FormRolesProfesionales,FormServiciosDiagnostico,FormEstudiosDiagnosticos,FormLugar,FormPlantillaEstudio
from django.forms import modelformset_factory
from django.contrib.auth import update_session_auth_hash


# Create your views here.

@personal_required
@login_required
def newPassword(request):
    persona = request.user 

    if request.method == "POST":
        form = FormularioActualizarPassword(request.POST, instance=persona)
        if form.is_valid():
            persona = form.save(commit=False)
            persona.usuario.debe_cambiar_contraseña = False 
            persona.usuario.save()
            persona.save() 
            update_session_auth_hash(request, persona) # Evita que se cierre la sesión
            return redirect("indexPersonal")
    else:
        form = FormularioActualizarPassword(instance=persona)

    return render(request, "newPassword.html", {"form": form})


@personal_required
@login_required
def indexPersonal(request):
    usuario = request.user.usuario
    tipo_usuario = usuario.tipoUsuario.id
    
    if tipo_usuario != 1:
        if usuario.debe_cambiar_contraseña:
            return redirect("newPassword")
    
    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id_especialidad = request.GET.get('id')
        # Verifica que la especialidad realmente pertenece al usuario
        if request.user.is_authenticated and hasattr(request.user, 'usuario'):
            if request.user.usuario.especialidadesUsuario.filter(especialidad__id=id_especialidad).exists():
                request.session['especialidad_actual'] = id_especialidad
        
    return render(request, "indexPersonal.html") 

### Seccion Superadmin ###
@personal_required
@login_required
def gestionDelPersonal(request):
    personal = Usuario.objects.all()
    return render(request, "superadmin/gestionPersonal/gestionPersonal.html", {"allPersonal":personal}) 

@personal_required
@login_required
def altaPersonal(request):
    if request.method == "GET":
        formUsuario = FormularioRegistroDePersonal()
        return render(request, "superadmin/gestionPersonal/altaPersona.html", {"formUsuario": formUsuario})

    if request.method == "POST":
        # Instanciar los formularios con los datos del POST
        formUsuario = FormularioRegistroDePersonal(request.POST)
        print(request.POST)
        
        # Validar que los formularios internos son válidos
        if formUsuario.is_valid() and formUsuario.persona_form.is_valid() and formUsuario.usuario_form.is_valid():
            try:
                persona = formUsuario.persona_form.save(commit=False)  
                # Establecer la contraseña de forma segura (hash)
                persona.set_password(formUsuario.persona_form.cleaned_data['password'])
                persona.save()  # Ahora guardamos la persona con la contraseña encriptada
                
                usuario = formUsuario.usuario_form.save(commit=False)  
                usuario.persona = persona  
                usuario.save()  

                messages.success(request, "El personal ha sido registrado correctamente.")
                return redirect('gestionDelPersonal')  # Redirigir a la gestión del personal
            except Exception as e:
                print(f"Error al guardar el usuario: {e}")
                messages.error(request, "Ocurrió un error al guardar el usuario. Intenta nuevamente.")
        else:
            print("Formulario inválido. Revisa los datos ingresados.")
            print(f"Errores de validación Persona: {formUsuario.persona_form.errors}")
            print(f"Errores de validación Usuario: {formUsuario.usuario_form.errors}")
            messages.error(request, "Formulario inválido. Revisa los datos ingresados.")  # Mensaje de error si el formulario es inválido

    return render(request, "superadmin/gestionPersonal/altaPersona.html", {"formUsuario": formUsuario})

@personal_required
@login_required
def detalle_usuario(request,id):
    usuario = Usuario.objects.get(id=id)
    
    if usuario != request.user.usuario and not request.user.is_staff: # Verificar si el turno pertenece al usuario actual o si el que intenta acceder es un superadmin
        return HttpResponseForbidden(render(request, "403.html"))
    
    if request.method == 'POST':
        tipo_form = request.POST.get("tipo_form")
        
        if tipo_form == "form_asignaciones":
            id_usuario = request.POST.get("id_usuario")
            formAsignaciones = FormularioAsignaciones(request.POST ,user=usuario)
            if formAsignaciones.is_valid():
                asignacion = formAsignaciones.save(commit=False)
                asignacion.usuario = Usuario.objects.get(id=id_usuario)
                asignacion.save()
                return redirect('detalle_usuario', id=id_usuario)  # Redirigir al detalle del usuario
        elif tipo_form == "form_editarPersonal":
            formUsuario = FormularioRegistroDePersonal(
                request.POST,
                persona_instance=usuario.persona,
                usuario_instance=usuario
            )
            if formUsuario.is_valid():
                print(request.POST)
                usuario_guardado = formUsuario.save(commit=True)  # Guarda tanto la persona como el usuario
                return redirect('detalle_usuario', id=usuario_guardado.id)  # Redirigir al detalle del usuario
            
        elif tipo_form == "form_lugarTrabajo":
            id_usuario = request.POST.get("id_usuario")
            formLugarTrabajo = FormularioLugarTrabajo(request.POST)
            if formLugarTrabajo.is_valid():
                lugarTrabajo = formLugarTrabajo.save(commit=False)
                lugarTrabajo.usuario = Usuario.objects.get(id=id_usuario)
                lugarTrabajo.save()
                return redirect('detalle_usuario', id=id_usuario)  # Redirigir al detalle del usuario
    else:
        formUsuario = FormularioRegistroDePersonal(
            persona_instance=usuario.persona,
            usuario_instance=usuario
        )
        
    especialidades = UsuarioXEspecialidadXServicioXrolesProfesionales.objects.filter(usuario_id=id)
    asignaciones = UsuarioXDepartamentoXJornadaXLugar.objects.filter(usuario_id=id)
    
    departamentos_con_jornadas = defaultdict(list)
    for asignacion in asignaciones:
        departamento_nombre = asignacion.departamento.nombre_departamento  
        departamentos_con_jornadas[asignacion.departamento].append({
            "info": f"Los días <strong>{asignacion.jornada.get_dia_display()}</strong> en el turno: <strong>{asignacion.jornada.get_turno_display()}</strong> trabaja en el <strong>{asignacion.lugar.nombre} ({asignacion.lugar.codigo})</strong>"
        })
        
    departamentos_con_jornadas = dict(departamentos_con_jornadas)

    return render(request, "superadmin/gestionPersonal/detallesUsuario.html",{"usuario":usuario,"especialidades":especialidades,"departamentos_con_jornadas": departamentos_con_jornadas,
                    "formUsuario":formUsuario,
                    "formAsignaciones": FormularioAsignaciones(user=usuario),"formLugarTrabajo": FormularioLugarTrabajo()  }) 

@personal_required
@login_required
def gestionDeDepartamentos(request):
    departamentos = Departamento.objects.all()
    formDepartamentos = FormDepartamentos()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            departamento = get_object_or_404(Departamento, id=id)
            data = {
                "id_departamento": departamento.id,
                "nombre_departamento": departamento.nombre_departamento,
                "tipo": departamento.tipo,
                "descripcion": departamento.descripcion
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)
    
    if request.method == "POST":
        id_departamento = request.POST.get('id_departamento')
        if id_departamento:
            departamento = get_object_or_404(Departamento, id=id_departamento)
            formDepartamentos = FormDepartamentos(request.POST, instance=departamento)
        else:
            formDepartamentos = FormDepartamentos(request.POST)

        if formDepartamentos.is_valid():
            formDepartamentos.save()
            return redirect("gestionDeDepartamentos")  
        else:
            print("Errores del formulario:", formDepartamentos.errors)
            return render(request, "superadmin/gestionDepartamentos.html", {"allDepartamentos": departamentos,"form": formDepartamentos,'abrir_modal_por_error': True  })
        
    return render(request, "superadmin/gestionDepartamentos.html", {"allDepartamentos": departamentos,"form": formDepartamentos  })


@personal_required
@login_required
def gestionDeEspecialidades(request):
    especialidades = Especialidades.objects.all()
    formEspecialidades = FormEspecialidades()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            especialidad = get_object_or_404(Especialidades, id=id)
            data = {
                "id": especialidad.id,
                "nombre_especialidad": especialidad.nombre_especialidad,
                "permite_turno": especialidad.permite_turno,
                "descripcion": especialidad.descripcion,
                "departamento": especialidad.departamento.id
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        id_especialidad = request.POST.get('id_especialidad')
        if id_especialidad:
            especialidad = get_object_or_404(Especialidades, id=id_especialidad)
            formEspecialidades = FormEspecialidades(request.POST, instance=especialidad)
        else:
            formEspecialidades = FormEspecialidades(request.POST)

        if formEspecialidades.is_valid():
            formEspecialidades.save()
            return redirect("gestionDeEspecialidades")  
        else:
            print("Errores del formulario:", formEspecialidades.errors)
            return render(request, "superadmin/gestionEspecialidades.html", {"allEspecialidades": especialidades,"form": formEspecialidades,'abrir_modal_por_error': True  })
        
    return render(request, "superadmin/gestionEspecialidades.html", {"allEspecialidades": especialidades,"form": formEspecialidades  })


@personal_required
@login_required
def gestionDeServiciosDiagnostico(request):
    servicios = ServicioDiagnostico.objects.all()
    formServicios = FormServiciosDiagnostico()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            servicio = get_object_or_404(ServicioDiagnostico, id=id)
            data = {
                "id_servicio": servicio.id,
                "nombre_servicio": servicio.nombre_servicio,
                "descripcion_servicio": servicio.descripcion,
                "departamento_servicio": servicio.departamento.id,
                "lugar_servicio": [lugar.id for lugar in servicio.lugar.all()]            
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        id_servicio = request.POST.get('id_servicio')
        if id_servicio:
            servicio = get_object_or_404(ServicioDiagnostico, id=id_servicio)
            formServicios = FormServiciosDiagnostico(request.POST, instance=servicio)
        else:
            formServicios = FormServiciosDiagnostico(request.POST)

        if formServicios.is_valid():
            formServicios.save()
            return redirect("gestionDeServiciosDiagnostico")  
        else:
            print("Errores del formulario:", formServicios.errors)
            return render(request, "superadmin/gestionServiciosDiagnostico.html", {"allServicios": servicios,"form": formServicios,'abrir_modal_por_error': True  })

    return render(request, "superadmin/gestionServiciosDiagnostico.html", {"allServicios": servicios,"form": formServicios  })

@personal_required
@login_required
def gestionDeEstudiosDiagnostico(request):
    estudios = EstudiosDiagnosticos.objects.all()
    formEstudiosDiagnostico = FormEstudiosDiagnosticos()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            estudio = get_object_or_404(EstudiosDiagnosticos, id=id)
            data = {
                "id_estudio": estudio.id,
                "nombre_estudio": estudio.nombre_estudio,
                "servicio_estudio": estudio.servicio_diagnostico.id,
                "especialidad_estudio": [especialidad.id for especialidad in estudio.especialidad.all()],           
                "tipo_resultado": estudio.tipo_resultado
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        id_estudio = request.POST.get('id_estudio')
        if id_estudio:
            estudio = get_object_or_404(EstudiosDiagnosticos, id=id_estudio)
            formEstudiosDiagnostico = FormEstudiosDiagnosticos(request.POST, instance=estudio)
        else:
            formEstudiosDiagnostico = FormEstudiosDiagnosticos(request.POST)

        if formEstudiosDiagnostico.is_valid():
            formEstudiosDiagnostico.save()
            return redirect("gestionDeEstudiosDiagnostico")  
        else:
            print("Errores del formulario:", formEstudiosDiagnostico.errors)
            return render(request, "superadmin/estudios/gestionEstudiosDiagnosticos.html", {"allEstudios": estudios,"form": formEstudiosDiagnostico,'abrir_modal_por_error': True  })

    return render(request, "superadmin/estudios/gestionEstudiosDiagnosticos.html", {"allEstudios": estudios,"form": formEstudiosDiagnostico  })

@personal_required
@login_required
def gestionDeLugares(request):
    lugares = Lugar.objects.all()
    formLugar = FormLugar()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            lugar = get_object_or_404(Lugar, id=id)
            data = {
                "id_lugar": lugar.id,
                "nombre_lugar": lugar.nombre,
                "tipo_lugar": lugar.tipo,
                "piso_lugar": lugar.piso,
                "codigo_lugar": lugar.codigo,
                "estado_lugar": lugar.estado,
                "capacidad_lugar": lugar.capacidad,
                "descripcion_lugar": lugar.descripcion,
                "isCritico_lugar": lugar.es_critico,
                "isActivo_lugar": lugar.activo,
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        id_lugar = request.POST.get('id_lugar')
        if id_lugar:
            lugar = get_object_or_404(Lugar, id=id_lugar)
            formLugar = FormLugar(request.POST, instance=lugar)
        else:
            formLugar = FormLugar(request.POST)

        if formLugar.is_valid():
            formLugar.save()
            return redirect("gestionDeLugares")  
        else:
            print("Errores del formulario:", formLugar.errors)
            return render(request, "superadmin/gestionLugares.html", {"allLugares": lugares,"form": formLugar,'abrir_modal_por_error': True  })

    return render(request, "superadmin/gestionLugares.html", {"allLugares": lugares,"form": formLugar  })

@personal_required
@login_required
def gestionDePlantillasEstudios(request):
    plantillas = PlantillaEstudio.objects.all()
    formPlantillaEstudio = FormPlantillaEstudio()

    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id = request.GET.get('id')
        if id:
            plantilla = get_object_or_404(PlantillaEstudio, id=id)
            data = {
                "id_plantilla": plantilla.id,
                "estudio_plantilla": plantilla.estudio.id,
                "estructura_estudio": plantilla.estructura
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        id_plantilla = request.POST.get('id_plantilla')
        if id_plantilla:
            plantilla = get_object_or_404(PlantillaEstudio, id=id_plantilla)
            formPlantillaEstudio = FormPlantillaEstudio(request.POST, instance=plantilla)
        else:
            formPlantillaEstudio = FormPlantillaEstudio(request.POST)

        if formPlantillaEstudio.is_valid():
            formPlantillaEstudio.save()
            return redirect("gestionDePlantillasEstudios")  
        else:
            print("Errores del formulario:", formPlantillaEstudio.errors)
            return render(request, "superadmin/estudios/gestionPlantillaEstudios.html", {"allPlantillas": plantillas,"form": formPlantillaEstudio,'abrir_modal_por_error': True  })

    return render(request, "superadmin/estudios/gestionPlantillaEstudios.html", {"allPlantillas": plantillas,"form": formPlantillaEstudio  })

@personal_required
@login_required
def gestionDeRoles(request):
    tiposUsuario = TiposUsuarios.objects.all()
    rolesProfesionales = RolesProfesionales.objects.all()
    formTipoUsuario = FormTiposUsuarios()
    formRolesProfesionales = FormRolesProfesionales()
    
    if request.method == "GET" and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        id_rol_profesional = request.GET.get('id_rol_profesional')
        id_tipo_usuario = request.GET.get('id_tipo_usuario')
        if id_rol_profesional:
            rol_profesional = get_object_or_404(RolesProfesionales, id=id_rol_profesional)
            data = {
                "id_rol_profesional": rol_profesional.id,
                "nombre_rol_profesional": rol_profesional.nombre_rol_profesional,
                "tipo_usuario": rol_profesional.tipoUsuario.id
            }
            return JsonResponse(data)
        elif id_tipo_usuario :
            tipo_usuario = get_object_or_404(TiposUsuarios, id=id_tipo_usuario)
            data = {
                "id_tipo_usuario": tipo_usuario.id,
                "nombre_tipo_usuario": tipo_usuario.nombre_tipoUsuario
            }
            return JsonResponse(data)
        else:
            return JsonResponse({"error": "ID no proporcionado"}, status=400)

    if request.method == "POST":
        tipo_form = request.POST.get('tipo-form')
        print(tipo_form)
        if tipo_form == "FormRolProfesional":
            id_rol_profesional = request.POST.get('id_rol_profesional')
            if id_rol_profesional:
                rol_profesional = get_object_or_404(RolesProfesionales, id=id_rol_profesional)
                formRolesProfesionales = FormRolesProfesionales(request.POST, instance=rol_profesional)
                title = "Editar rol profesional"
            else:
                formRolesProfesionales = FormRolesProfesionales(request.POST)
                title = "Nuevo rol profesional"

            if formRolesProfesionales.is_valid():
                formRolesProfesionales.save()
                return redirect("gestionDeRoles")
            else:
                print("Errores del formulario:", formRolesProfesionales.errors)
                return render(request, "superadmin/gestionRoles.html", {
                    "allTiposUsuarios": tiposUsuario,
                    "allRolesProfesionales": rolesProfesionales,
                    "formTipoUsuarios": formTipoUsuario,
                    "formRolesProfesionales": formRolesProfesionales,
                    'abrir_modal_rol_profesional_por_error': True,
                    'title_modal': title,
                })   
            
        elif tipo_form == "FormTipoUsuario":
            id_tipo_usuario = request.POST.get('id_tipo_usuario')
            if id_tipo_usuario:
                tipo_usuario = get_object_or_404(TiposUsuarios, id=id_tipo_usuario)
                formTipoUsuario = FormTiposUsuarios(request.POST, instance=tipo_usuario)
                title = "Editar tipo de usuario"
            else:
                formTipoUsuario = FormTiposUsuarios(request.POST)
                title = "Nuevo tipo de usuario"
            
            if formTipoUsuario.is_valid():
                formTipoUsuario.save()
                return redirect("gestionDeRoles")
            else:
                print("Errores del formulario:", formTipoUsuario.errors)
                return render(request, "superadmin/gestionRoles.html", {
                    "allTiposUsuarios": tiposUsuario,
                    "allRolesProfesionales": rolesProfesionales,
                    "formTipoUsuarios": formTipoUsuario,
                    "formRolesProfesionales": formRolesProfesionales,
                    'abrir_modal_tipo_usuario_por_error': True,
                    'title_modal': title
                })   
                
    return render(request, "superadmin/gestionRoles.html", {
        "allTiposUsuarios": tiposUsuario,
        "allRolesProfesionales": rolesProfesionales,
        "formTipoUsuarios": formTipoUsuario,
        "formRolesProfesionales": formRolesProfesionales
    })   

@personal_required
@login_required
def listaPacientes(request):
    pacientes = Paciente.objects.all()
    return render(request, "superadmin/listaPacientes/listaPacientes.html", {"allPacientes":pacientes}) 

@personal_required
@login_required
def turnosPaciente(request, id):
    paciente = Paciente.objects.get(id=id)
    turnosDelPaciente = Turno.objects.filter(paciente_id=id)
    turnosEstudiosDelPaciente = TurnoEstudio.objects.filter(orden__consulta__turno__paciente_id=id)
    return render(request, "superadmin/listaPacientes/turnosPaciente.html", {"turnosDelPaciente":turnosDelPaciente,"turnosEstudiosDelPaciente": turnosEstudiosDelPaciente, "paciente":paciente}) 

### Fin seccion Superadmin ###



### Seccion medico ###

@personal_required
@login_required
def turnosProgramados(request):
    especialidad_id = request.session.get('especialidad_actual')
    if especialidad_id:
        especialidad = Especialidades.objects.get(id=especialidad_id)
        
    hoy = timezone.now().date() 
    turnos = Turno.objects.filter(profesional_id=request.user.usuario, fecha_turno__gte=hoy,especialidad=especialidad ).order_by("fecha_turno") # fecha_turno__gte=hoy: Este filtro asegura que solo se obtendrán los turnos cuya fecha sea hoy o en el futuro
    turnos_hoy = []
    turnos_otros_dias = []
    for turno in turnos:
        if turno.fecha_turno == hoy:
            turnos_hoy.append(turno)
        else:
            turnos_otros_dias.append(turno)
        
    return render(request, "medico/turnos/turnosProgramados.html",{ "turnos_hoy": turnos_hoy,"turnos_otros_dias": turnos_otros_dias})

@personal_required
@login_required
def registrarConsulta(request, id_turno):
    hoy = timezone.now().date() 
    turno = Turno.objects.get(id=id_turno)
    especialidad = turno.especialidad
    
    if turno.fecha_turno != hoy or turno.profesional != request.user.usuario  or turno.consulta.exists() : # Verificar si el turno es de hoy o si el profesional pedido para ese turno es el usuario actual o si ya hay una consulta asociada a ese turno
        return HttpResponseForbidden(render(request, "403.html"))

    # historial de consultas del paciente en la misma especialidad
    consultas = Consultas.objects.filter(
        turno__paciente=turno.paciente,
        turno__especialidad=turno.especialidad
    ).prefetch_related('estudios', 'medicaciones').order_by('-fecha')[:10] 
    
    lista_estudios = EstudiosDiagnosticos.objects.filter(especialidad=especialidad)  # Estudios disponibles solo para esta especialidad
    
    form_consulta = FormConsulta(request.POST or None)
    # 🔑 Prefijos distintos:
    estudios_formset = EstudiosFormSet(request.POST or None, queryset=OrdenEstudio.objects.none(), prefix='estudios')
    medicaciones_formset = MedicacionesFormSet(request.POST or None, queryset=Medicaciones.objects.none(), prefix='medicaciones')
    
    # Limitar SIEMPRE el queryset de tipo_estudio
    for form in estudios_formset.forms:
        form.fields['tipo_estudio'].queryset = lista_estudios

    if request.method == "POST":
        if form_consulta.is_valid() and estudios_formset.is_valid() and medicaciones_formset.is_valid():
            consulta = form_consulta.save(commit=False)
            consulta.turno = turno
            consulta.save()

            # Guardar estudios
            estudios = estudios_formset.save(commit=False)
            for estudio in estudios:
                estudio.consulta = consulta
                estudio.solicitado_por = request.user.usuario
                estudio.save()
            for obj in estudios_formset.deleted_objects: # Eliminar los marcados como DELETE
                obj.delete()

            # Guardar medicaciones
            medicaciones = medicaciones_formset.save(commit=False)
            for medicacion in medicaciones:
                medicacion.consulta = consulta
                medicacion.recetada_por = request.user.usuario
                medicacion.save()
            for obj in medicaciones_formset.deleted_objects:  # Eliminar los marcados como DELETE
                obj.delete()

            # Marcar turno como atendido
            turno.asistio = True
            turno.estado = "atendido"
            turno.save()

            return redirect('turnosProgramados')

    context = {
        'form_consulta': form_consulta,
        'estudios_formset': estudios_formset,
        'medicaciones_formset': medicaciones_formset,
        'historialConsultas': consultas,
        'datos_turno': turno,
    }

    return render(request, 'medico/consultas/registroConsulta.html', context)

def editarConsulta(request, id_consulta):
    hoy = timezone.now().date() 
    consulta = get_object_or_404(Consultas, id=id_consulta)
    turno = consulta.turno  # lo reutilizamos para contexto
    especialidad = turno.especialidad

    if turno.fecha_turno != hoy or turno.profesional != request.user.usuario: # Verificar si la consulta pertenece al usuario actual
        
        return HttpResponseForbidden(render(request, "403.html"))

    # historial de consultas del paciente en la misma especialidad
    consultas = Consultas.objects.filter(
        turno__paciente=turno.paciente,
        turno__especialidad=turno.especialidad
    ).prefetch_related('estudios', 'medicaciones').order_by('-fecha')[:10] 
    
                
    lista_estudios = EstudiosDiagnosticos.objects.filter(especialidad=especialidad)  # Estudios disponibles solo para esta especialidad
    
    form_consulta = FormConsulta(request.POST or None, instance=consulta)
    # 🔑 Prefijos distintos
    estudios_formset = EstudiosFormSet(request.POST or None, queryset=consulta.estudios.all(), prefix='estudios')
    medicaciones_formset = MedicacionesFormSet(request.POST or None, queryset=consulta.medicaciones.all(), prefix='medicaciones')

    # Limitar SIEMPRE el queryset de tipo_estudio
    for form in estudios_formset.forms:
        form.fields['tipo_estudio'].queryset = lista_estudios

    if request.method == "POST":
        print("is_valid consulta:", form_consulta.is_valid())
        print("is_valid estudios:", estudios_formset.is_valid())
        print("is_valid medicaciones:", medicaciones_formset.is_valid())

        if not form_consulta.is_valid():
            print(form_consulta.errors.as_json())

        if not estudios_formset.is_valid():
            for form in estudios_formset.forms:
                print(form.errors.as_json())

        if not medicaciones_formset.is_valid():
            for form in medicaciones_formset.forms:
                print(form.errors.as_json())
        if form_consulta.is_valid() and estudios_formset.is_valid() and medicaciones_formset.is_valid():
            consulta = form_consulta.save(commit=False)
            consulta.turno = turno
            consulta.save()

            # Guardar estudios
            estudios = estudios_formset.save(commit=False)
            for estudio in estudios:
                estudio.consulta = consulta
                estudio.solicitado_por = request.user.usuario
                estudio.save()
            for obj in estudios_formset.deleted_objects: # Eliminar los marcados como DELETE
                obj.delete()

            # Guardar medicaciones
            medicaciones = medicaciones_formset.save(commit=False)
            for medicacion in medicaciones:
                medicacion.consulta = consulta
                medicacion.recetada_por = request.user.usuario
                medicacion.save()
            for obj in medicaciones_formset.deleted_objects:  # Eliminar los marcados como DELETE
                obj.delete()

            # Marcar turno como atendido
            turno.asistio = True
            turno.estado = "atendido"
            turno.save()

            return redirect('turnosProgramados')

    context = {
        'form_consulta': form_consulta,
        'estudios_formset': estudios_formset,
        'medicaciones_formset': medicaciones_formset,
        'historialConsultas': consultas,
        'datos_turno': turno,
        'consulta': consulta,
        "edicion": True  
    }
    return render(request, 'medico/consultas/registroConsulta.html', context)



@personal_required
@login_required
def historialConsultas(request):
    especialidad_id = request.session.get('especialidad_actual')
    if especialidad_id:
        especialidad = Especialidades.objects.get(id=especialidad_id)
    # Traer consultas, medicaciones y estudios relacionados de forma eficiente
    consultas = Consultas.objects.filter(turno__profesional=request.user.usuario, turno__especialidad = especialidad).prefetch_related('estudios', 'medicaciones')  # trae todas las medicaciones y estudios asociados a las consultas que hayas filtrado

    return render(request, "medico/consultas/consultas.html",{"consultas":consultas})

@personal_required
@login_required
def medicacionyestudios(request):    
    if request.method == "GET" and request.headers.get("x-requested-with") == "XMLHttpRequest":
        id_consulta = request.GET.get("id")
        consulta = get_object_or_404(Consultas, id=id_consulta)
        profesional_actual = request.user.usuario    
        
        if not id_consulta:
            return JsonResponse({"error": "ID de consulta no proporcionado"}, status=400)
            
        # Verificar si el turno pertenece al profesional actual
        if consulta.turno.profesional != profesional_actual:
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
    
    # return HttpResponseNotFound(render(request, "404.html"))


### Fin seccion medico ###



### Seccion Cargador de datos ### 
# Despues pasar a utils.py esta funcion:
from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table, TableStyle, PageBreak
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
import os
from io import BytesIO
from django.core.files.base import ContentFile
from reportlab.pdfgen import canvas  # ⚠️ Importar esto


from io import BytesIO
from django.core.files.base import ContentFile
from reportlab.platypus import (
    SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
)
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from reportlab.pdfgen import canvas
from PyPDF2 import PdfMerger # sirve para importar la clase PdfMerger del módulo PyPDF2, que se utiliza para combinar (mergear) múltiples archivos PDF en uno solo.  pip install PyPDF2
import os


def generar_pdf_resultado(resultado_estudio):
    tipo = resultado_estudio.turno_estudio.orden.tipo_estudio.tipo_resultado

    # Obtener datos comunes
    turno = resultado_estudio.turno_estudio
    paciente = turno.orden.consulta.turno.paciente.persona
    profesional = turno.orden.consulta.turno.profesional.persona
    servicio = turno.orden.consulta.turno.especialidad
    estudio = turno.orden.tipo_estudio

    # Encabezado para todos los tipos
    encabezado = [
        f"<b>Paciente:</b> {paciente.get_full_name()} - <b>DNI:</b> {paciente.dni}",
        f"<b>Estudio:</b> {estudio.nombre_estudio}",
        f"<b>Fecha del estudio:</b> {turno.fecha_turno.strftime('%d/%m/%Y')}",
        f"<b>Solicitado por:</b> {profesional.get_full_name()} - <b>DNI:</b> {profesional.dni} - <b>Servicio:</b> {servicio.nombre_especialidad}",
        f"<b>N° Orden:</b> {turno.orden.id}",
        f"<b>Motivo del estudio:</b> {turno.orden.motivo_estudio}",
    ]

    # --- 🔹 CASO: Imagen ---
    if tipo == "img":
        # 1️⃣ Primera página con encabezado e informe
        buffer_texto = BytesIO()
        doc = SimpleDocTemplate(
            buffer_texto,
            pagesize=A4,
            leftMargin=30,
            rightMargin=30,
            topMargin=40,
            bottomMargin=40
        )  
        styles = getSampleStyleSheet()
        elements = []
        
        elements.append(Paragraph("Resultado del Estudio", styles["Heading1"]))
        elements.append(Spacer(1, 20))

        for linea in encabezado:
            elements.append(Paragraph(linea, styles["Normal"]))
            elements.append(Spacer(1, 6))
        elements.append(Spacer(1, 12))

        if resultado_estudio.informe:
            elements.append(Paragraph("<b>Informe</b>", styles["Heading2"]))
            elements.append(Spacer(1, 12))
            elements.append(Paragraph(resultado_estudio.informe.replace("\n", "<br/>"), styles["Normal"]))

        doc.build(elements)

        # 2️⃣ Páginas de imágenes (una por hoja, tamaño completo)
        buffer_imagenes = BytesIO()
        c = canvas.Canvas(buffer_imagenes, pagesize=A4)

        imagenes = resultado_estudio.imagenes.all()
        for img in imagenes:
            try:
                c.drawImage(img.imagen.path, 0, 0, width=A4[0], height=A4[1])
                c.showPage()

                # Limpiar archivos temporales
                if os.path.exists(img.imagen.path):
                    os.remove(img.imagen.path)
                img.delete()
            except Exception as e:
                print(f"Error procesando imagen {img}: {e}")

        c.save()

        # 3️⃣ Combinar textos + imágenes
        pdf_final = BytesIO()
        merger = PdfMerger()
        merger.append(buffer_texto)
        if imagenes.exists():
            merger.append(buffer_imagenes)
        merger.write(pdf_final)
        merger.close()

        # 4️⃣ Guardar PDF final
        nombre_archivo = f"resultado_estudio_{resultado_estudio.id}.pdf"
        resultado_estudio.archivo_pdf.save(nombre_archivo, ContentFile(pdf_final.getvalue()))
        resultado_estudio.save()
        return

    # --- 🔹 Para el resto de tipos (lab, fisio, eval) ---
    buffer = BytesIO()
    doc = SimpleDocTemplate(
        buffer,
        pagesize=A4,
        leftMargin=30,
        rightMargin=30,
        topMargin=40,
        bottomMargin=40
    )
    styles = getSampleStyleSheet()
    elements = []

    elements.append(Paragraph("Resultado del Estudio", styles["Heading1"]))
    elements.append(Spacer(1, 20))

    for linea in encabezado:
        elements.append(Paragraph(linea, styles["Normal"]))
        elements.append(Spacer(1, 6))
    elements.append(Spacer(1, 12))

    # 🔸 Laboratorio
    if tipo == "lab" and resultado_estudio.datos_especificos:
        data = [["Parámetro", "Valor", "Unidad", "Referencia"]]
        styles = getSampleStyleSheet()
        normal_style = styles["Normal"]
        data = [["Parámetro", "Valor", "Unidad","Referencia"]]
        for param, detalle in resultado_estudio.datos_especificos.items():
            data.append([
                Paragraph(str(param), normal_style),
                Paragraph(str(detalle.get("valor", "")), normal_style),
                Paragraph(str(detalle.get("unidad", "")), normal_style),
                Paragraph(str(detalle.get("referencia", "")), normal_style)
            ])

        tabla = Table(data)
        tabla.setStyle(TableStyle([
            ("BACKGROUND", (0, 0), (-1, 0), colors.lightgrey),
            ("GRID", (0, 0), (-1, -1), 1, colors.black),
            ("VALIGN", (0, 0), (-1, -1), "TOP"),
            ("ALIGN", (0, 0), (-1, -1), "LEFT"),
        ]))
        elements.append(Paragraph("<b>Resultados de Laboratorio</b>", styles["Heading2"]))
        elements.append(Spacer(1, 12))
        elements.append(tabla)
        elements.append(Spacer(1, 20))

    # 🔸 Estudio fisiológico
    elif tipo == "fisio" and resultado_estudio.datos_especificos:
        styles = getSampleStyleSheet()
        normal_style = styles["Normal"]
        data = [["Parámetro", "Valor", "Unidad","Referencia","Interpretacion"]]
        for param, detalle in resultado_estudio.datos_especificos.items():
            data.append([
                Paragraph(str(param), normal_style),
                Paragraph(str(detalle.get("valor", "")), normal_style),
                Paragraph(str(detalle.get("unidad", "")), normal_style),
                Paragraph(str(detalle.get("referencia", "")), normal_style),
                Paragraph(str(detalle.get("interpretacion", "")), normal_style)
            ])

        tabla = Table(data)
        tabla.setStyle(TableStyle([
            ("BACKGROUND", (0, 0), (-1, 0), colors.lightgrey),
            ("GRID", (0, 0), (-1, -1), 1, colors.black),
            ("VALIGN", (0, 0), (-1, -1), "TOP"),
            ("ALIGN", (0, 0), (-1, -1), "LEFT"),
        ]))
        elements.append(Paragraph("<b>Resultados de Estudio Fisiológico</b>", styles["Heading2"]))
        elements.append(Spacer(1, 12))
        elements.append(tabla)
        elements.append(Spacer(1, 20))

    # 🔸 Evaluación clínica
    elif tipo == "eval":
        elements.append(Paragraph("<b>Evaluación Clínica</b>", styles["Heading2"]))
        elements.append(Spacer(1, 12))

    # 🔸 Informe (para lab, fisio, eval)
    if resultado_estudio.informe:
        elements.append(Paragraph("<b>Informe</b>", styles["Heading2"]))
        elements.append(Spacer(1, 12))
        elements.append(Paragraph(resultado_estudio.informe.replace("\n", "<br/>"), styles["Normal"]))

    # Guardar PDF final
    doc.build(elements)
    nombre_archivo = f"resultado_estudio_{resultado_estudio.id}.pdf"
    resultado_estudio.archivo_pdf.save(nombre_archivo, ContentFile(buffer.getvalue()))
    resultado_estudio.save()


def verEstudios(request):
    usuarioDepartamentos = UsuarioXDepartamentoXJornadaXLugar.objects.filter(usuario=request.user.usuario)
    departamentos_ids = usuarioDepartamentos.values_list('departamento__id', flat=True)

    estudiosRealizados = TurnoEstudio.objects.filter(
        estado="atendido",
        servicio_diagnostico__departamento__id__in=departamentos_ids # Solo traigo los analisis/estudios/radiografias,etc que se hacen en el departamento en donde trabaja este usuario.
    )

    return render(request, "cargadorResultados/estudiosRealizados.html", {"estudios": estudiosRealizados})


def cargar_resultado(request, turno_id):
    turno = get_object_or_404(TurnoEstudio, id=turno_id)

    # Verificar si ya existe un resultado cargado
    if ResultadoEstudio.objects.filter(turno_estudio=turno).exists():
        return redirect("verEstudios")

    tipo = turno.orden.tipo_estudio.tipo_resultado
    resultado = ResultadoEstudio(turno_estudio=turno)

    if request.method == "POST":
        form = ResultadoEstudioForm(request.POST, request.FILES, turno=turno, instance=resultado)

        # 🔹 Caso imágenes: permitir múltiples
        if tipo == "img":
            ImagenFormSet = modelformset_factory(ResultadoImagen, form=ResultadoImagenForm, extra=3, can_delete=True)
            formset = ImagenFormSet(request.POST, request.FILES, queryset=ResultadoImagen.objects.none())

            if form.is_valid() and formset.is_valid():
                resultado = form.save(commit=False)
                resultado.turno_estudio = turno
                resultado.cargado_por = request.user.usuario
                resultado.save()

                for f in formset.cleaned_data:
                    if f and f.get("imagen"):
                        imagen_obj = ResultadoImagen.objects.create(imagen=f["imagen"])
                        resultado.imagenes.add(imagen_obj) # 2. Asociarla al ResultadoEstudio
                        
                generar_pdf_resultado(resultado)
                turno.estado = "realizado"
                turno.asistio = True
                turno.save()
                return redirect("verEstudios")

        else:
            # 🔹 Laboratorio, fisiológicos o evaluaciones
            if form.is_valid():
                resultado = form.save(commit=False)

                resultado.turno_estudio = turno
                resultado.cargado_por = request.user.usuario
                resultado.save()

                generar_pdf_resultado(resultado)
                turno.estado = "realizado"
                turno.asistio = True
                turno.save()
                return redirect("verEstudios")
    else:
        form = ResultadoEstudioForm(turno=turno)

        if tipo == "img":
            ImagenFormSet = modelformset_factory(ResultadoImagen, form=ResultadoImagenForm, extra=3, can_delete=True)
            formset = ImagenFormSet(queryset=ResultadoImagen.objects.none())
            return render(request, "cargadorResultados/cargar_resultado.html", {"form": form, "formset": formset, "turno": turno})

    return render(request, "cargadorResultados/cargar_resultado.html", {"form": form, "turno": turno})

### Fin Seccion Cargador de datos ### 



# INSERT INTO controlusuario_rolesprofesionales (id, nombre_rol_profesional, tipoUsuario_id) VALUES
# -- URGENCIAS
# (1, 'Médico de Urgencias', 2),
# (2, 'Cirujano de Urgencias', 2),

# -- CLÍNICAS GENERALES
# (3, 'General', 2),
# (4, 'Pediatra', 2),
# (5, 'Ginecólogo y Obstetra', 2),
# (6, 'Dermatólogo', 2),

# -- CIRUGÍAS
# (7, 'Cirujano General', 2),
# (8, 'Cirujano Oncológico', 2),
# (9, 'Cirujano Vascular', 2),

# -- CUIDADOS CRÍTICOS Y ANESTESIA
# (10, 'Intensivista', 2),
# (11, 'Anestesiólogo', 2),

# -- IMÁGENES (SERVICIO DIAGNÓSTICO)
# (12, 'Radiólogo Intervencionista', 2),

# -- LABORATORIO Y PATOLOGÍA (SERVICIO DIAGNÓSTICO)
# (14, 'Patólogo', 2),


# -- ONCOLOGÍA
# (17, 'Oncólogo', 2),
# (18, 'Oncólogo Ginecológico', 2),

# -- PEDIATRÍA ESPECIALIZADA
# (19, 'Neonatólogo', 2),
# (20, 'Pediatra General', 2), # Borrar Pediatria general

# -- GINECOLOGÍA
# (21, 'Obstetra', 2),
# (22, 'Ginecólogo', 2),

# -- DERMATOLOGÍA
# (23, 'Dermatólogo Estético', 2),
# (24, 'Cirujano Dermatológico', 2),

# -- URGENCIAS PEDIÁTRICAS Y DESASTRES
# (25, 'Médico de Emergencias Pediátricas', 2),
# (26, 'Médico de Desastres', 2),

# -- ESPECIALIDADES CLÍNICAS
# (27, 'Cardiólogo', 2),
# (28, 'Neumonólogo', 2),
# (29, 'Endocrinólogo', 2),
# (30, 'Oftalmólogo', 2),
# (31, 'Otorrinolaringólogo', 2),
# (32, 'Urólogo', 2),
# (33, 'Reumatólogo', 2),
# (34, 'Gastroenterólogo', 2),
# (35, 'Neurólogo', 2),

# -- CIRUGÍAS ESPECÍFICAS
# (36, 'Cirujano Torácico', 2),
# (37, 'Cirujano Plástico y Estético', 2),
# (38, 'Traumatólogo Ortopédico', 2),

# -- TERAPIA INTENSIVA / NEUROCRÍTICA
# (39, 'Neurointensivista', 2),
# (40, 'Paliativista', 2);
