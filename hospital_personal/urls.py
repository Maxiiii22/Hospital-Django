from django.urls import path
from . import views 

urlpatterns = [
    path("", views.indexPersonal, name="indexPersonal"),
    path("cambiar-password/", views.newPassword, name="newPassword"),
    # Admin:
    path("gestion-personal/", views.gestionDelPersonal, name="gestionDelPersonal"),
    path("gestion-personal/alta-personal", views.altaPersonal, name="altaPersonal"),
    path("detalles-usuario-<int:id>",views.detalle_usuario, name ="detalle_usuario"),
    path("gestion-departamentos/", views.gestionDeDepartamentos, name="gestionDeDepartamentos"),
    path("gestion-roles/", views.gestionDeRoles, name="gestionDeRoles"),
    path("gestion-especialidades/", views.gestionDeEspecialidades, name="gestionDeEspecialidades"),
    path("gestion-servicios-diagnosticos/", views.gestionDeServiciosDiagnostico, name="gestionDeServiciosDiagnostico"),
    path("gestion-estudios-diagnosticos/", views.gestionDeEstudiosDiagnostico, name="gestionDeEstudiosDiagnostico"),
    path("gestion-plantillas-estudios/", views.gestionDePlantillasEstudios, name="gestionDePlantillasEstudios"),
    path("gestion-lugares/", views.gestionDeLugares, name="gestionDeLugares"),
    path("lista-pacientes/", views.listaPacientes, name="listaPacientes"),
    path("lista-pacientes/turnos-paciente-<int:id>", views.turnosPaciente, name="turnosPaciente"),
    # Medico:
    path("turnos/", views.turnosProgramados, name="turnosProgramados"),
    path("consultas/", views.historialConsultas, name="historialConsultas"),
    path("consultas/registrar/<int:id_turno>", views.registrarConsulta, name="registrarConsulta"),
    path("consultas/editar/<int:id_consulta>", views.editarConsulta, name="editarConsulta"),
    path("consultas/medicacionyestudios/", views.medicacionyestudios, name="medicacionyestudios"),
    # Cargador de resultados:
    path("cargar-resultados/", views.verEstudios, name="verEstudios"),
    path("cargar-resultados/turno-estudio-<int:turno_id>", views.cargar_resultado, name="cargar_resultado")
    
]