def especialidad_actual(request):
    if request.user.is_authenticated and hasattr(request.user, 'usuario'):
        usuario = request.user.usuario

        especialidad_id = request.session.get('especialidad_actual')
        if especialidad_id:
            # Opción 1: Recuperar también el nombre de la especialidad si ya tienes el ID
            from .models import Especialidades  # Ajusta según tu estructura

            try:
                especialidad = Especialidades.objects.get(id=especialidad_id)
                return {
                    'especialidad_actual_id': especialidad.id,
                    'especialidad_actual_nombre': especialidad.nombre_especialidad
                }
            except Especialidades.DoesNotExist:
                pass  # En caso de que se haya borrado, continuar y obtener una nueva

        # Si no está en sesión, obtener desde el modelo
        especialidad_usuario = usuario.especialidadesUsuario.first()
        if especialidad_usuario and hasattr(especialidad_usuario, 'especialidad'):
            especialidad_id = especialidad_usuario.especialidad.id
            especialidad_nombre = especialidad_usuario.especialidad.nombre_especialidad
            request.session['especialidad_actual'] = especialidad_id  # Guardar en sesión
            return {
                'especialidad_actual_id': especialidad_id,
                'especialidad_actual_nombre': especialidad_nombre
            }

    # Valor por defecto si no cumple condiciones
    return {
        'especialidad_actual_id': None,
        'especialidad_actual_nombre': None
    }
