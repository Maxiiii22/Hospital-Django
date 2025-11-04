from django.db import models
from hospital_pacientes.models import Paciente
from datetime import time
from django.core.exceptions import ValidationError
from django.urls import reverse

class Departamento(models.Model):
    nombre_departamento = models.CharField(max_length=255)
    tipo = models.CharField(max_length=255)
    descripcion = models.TextField()
    
    def __str__(self):
        return f"{self.nombre_departamento}"

class Jorna_laboral(models.Model):
    DIAS_CHOICES = [
        ("lunes", 'Lunes'),
        ("martes", 'Martes'),
        ("miercoles", 'Miércoles'),
        ("jueves", 'Jueves'),
        ("viernes", 'Viernes'),
        ("sabado", 'Sábado'),
        ("domingo", 'Domingo'),
    ]
    
    TURNOS_CHOICES = [
        ('dia', 'Diurno (7:00 a 15:00)'),
        ('tarde', 'Vespertino (15:00 a 23:00)'),
        ('noche', 'Nocturno (23:00 a 7:00)'),
        ('on-call', 'Guardia'),
    ] 
    
    dia = models.CharField(max_length=20, choices=DIAS_CHOICES)
    turno = models.CharField(max_length=10, choices=TURNOS_CHOICES)
    
    def jornadaDisponible(self, usuario, lugar):
        """
        Me fijo si el usuario tiene esta jornada ocupada o disponible
        """
        asignacion = UsuarioLugarTrabajoAsignado.objects.filter(
            jornada=self,
            usuario=usuario
        ).first()

        if asignacion:
            if asignacion.lugar.id == lugar.id:
                return "Este usuario ya tiene asignada esta jornada en este lugar"
            else:
                return "Este usuario ya tiene asignada esta jornada en otro lugar"
        
        return None 
    
    def __str__(self):
        return f"Los dias {self.get_dia_display()} trabaja en el turno: {self.get_turno_display()} de este departamento"

class Lugar(models.Model):
    TIPO_CHOICES = [
        ('cons', 'Consultorio'),
        ('lab', 'Laboratorio'),
        ('img', 'Sala de imagenología'), # Espacio equipado con tecnología para obtener imágenes del cuerpo con fines diagnósticos. (Sala de Rayos X, Sala de Resonancia Magnética, Sala de Tomografía (TAC), Sala de Ecografía, Sala de Mamografía, etc)
        ('diag_func', 'Sala de diagnóstico funcional'),  # Área donde se evalúan funciones fisiológicas del organismo mediante estudios no invasivos o mínimamente (Sala de Electrocardiogramas, Sala de Espirometría, Sala de Endoscopía, Sala de Electroencefalograma,etc)
        ('unidad_atenc', 'Unidad de atención'), # Áreas hospitalarias especializadas en la atención continua y crítica de pacientes, con personal y equipamiento permanente. (Unidad de Cuidados Intensivos (UCI), Unidad Neonatal, Unidad de Recuperación Post-Anestésica, Unidad de Cuidados Neurocríticos,etc)
        ('qui', 'Quirófano'),
        ('proc', 'Sala de procedimiento no quirúrgico'),  # Espacio donde se realizan procedimientos médicos o terapéuticos sin necesidad de cirugía o anestesia general. (Sala de Hemodiálisis, Sala de Quimioterapia, Sala de Infiltraciones o Curaciones,etc)
        ('hab', 'Habitación'),
        ('area_apoyo', 'Área de apoyo') # Espacios que brindan soporte operativo, logístico o educativo al funcionamiento del hospital.
    ]
    
    nombre = models.CharField(max_length=100)
    tipo = models.CharField(max_length=50,choices=TIPO_CHOICES)
    piso = models.IntegerField() # Cambiar a PositiveIntegerField al terminar la BD
    sala = models.PositiveIntegerField(unique=True)  
    abreviacion = models.CharField(max_length=20) 
    capacidad = models.PositiveIntegerField(default=1)  
    descripcion = models.TextField(blank=True, null=True)
    es_critico = models.BooleanField(default=False)
    activo = models.BooleanField(default=True) 
    departamento = models.ForeignKey(Departamento, on_delete=models.SET_NULL, blank=True, null=True)  # Despues sacar el blank y el null cuando le carguemos sus respectivo departgamento a cada lugar.

    def estado_por_jornada(self, jornada):
        """
        Calcula dinámicamente el estado del lugar en una jornada específica.
        """
        asignaciones = UsuarioLugarTrabajoAsignado.objects.filter(
            lugar=self,
            jornada=jornada
        ).count()
        if asignaciones >= self.capacidad:
            return 'Ocupado',asignaciones
        return 'Disponible',asignaciones
    
    def __str__(self):
        if self.activo:
            return f"{self.nombre} ({self.abreviacion}-{self.sala})"
        else:
            return f"{self.nombre} ({self.abreviacion}-{self.sala})"

class UsuarioRolProfesionalAsignado(models.Model):
    usuario = models.ForeignKey('controlUsuario.Usuario', on_delete=models.CASCADE,related_name="rolesProfesionalesUsuario")
    rol_profesional = models.ForeignKey('controlUsuario.RolesProfesionales', on_delete=models.CASCADE)
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['usuario', 'rol_profesional'], name='unique_usuario_rol_profesional') # Con UniqueConstraint, nos aseguramos de que un mismo usuario no pueda estar asignado al mismo rol_profesional más de una vez.
        ]
    
    def __str__(self):
        if (self.rol_profesional.servicio_diagnostico):
            return f"Usuario: {self.usuario.persona.get_full_name()} (N° Legajo: {self.usuario.persona.login_id}) - Servicio en el que  trabaja: {self.rol_profesional.servicio_diagnostico.nombre_servicio} como {self.rol_profesional.nombre_rol_profesional}"
        else:
            return f"Usuario: {self.usuario.persona.get_full_name()} (N° Legajo: {self.usuario.persona.login_id}) - Especialidad en que trabaja: {self.rol_profesional.especialidad.nombre_especialidad} como {self.rol_profesional.nombre_rol_profesional}"


class UsuarioLugarTrabajoAsignado(models.Model):
    lugar = models.ForeignKey(Lugar, on_delete=models.CASCADE)
    usuario = models.ForeignKey('controlUsuario.Usuario', on_delete=models.CASCADE, related_name="UsuariosAsignadosAEsteLugar")
    jornada = models.ForeignKey(Jorna_laboral, on_delete=models.CASCADE)
    rolProfesionalAsignado = models.ForeignKey(UsuarioRolProfesionalAsignado, on_delete=models.SET_NULL, null=True,related_name="RolesProfesionalesAsignados")
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['usuario', 'jornada'], name='unique_usuario_jornada') # Con UniqueConstraint, nos aseguramos de que un mismo usuario no pueda estar asignado a la misma jornada más de una vez, aunque sea en diferentes departamentos.
        ]
        
    def __str__(self):
        return (
            f"El usuario (ID:{self.usuario.id} - {self.usuario.persona.get_full_name()} - {self.usuario.tipoUsuario}) trabaja los días {self.jornada.get_dia_display()} en el lugar '{self.lugar.nombre} ({self.lugar.abreviacion})' en el horario: {self.jornada.get_turno_display()} como {self.rolProfesionalAsignado.rol_profesional.nombre_rol_profesional} (En {getattr(self.rolProfesionalAsignado.rol_profesional.especialidad, 'nombre_especialidad', getattr(self.rolProfesionalAsignado.rol_profesional.servicio_diagnostico, 'nombre_servicio', 'Sin asignar'))})"
        )    
    def clean(self):
        if self.lugar:
            if not self.lugar.activo:
                self.add_error("lugar","No se puede asignar un usuario a un lugar que no está activo")
            
            # Excluir la instancia actual si ya existe (evita error al hacer update)
            asignaciones_en_lugar = UsuarioLugarTrabajoAsignado.objects.filter(lugar=self.lugar,jornada=self.jornada)
            if self.pk:
                asignaciones_en_lugar = asignaciones_en_lugar.exclude(pk=self.pk)
            
            if asignaciones_en_lugar.count() >= self.lugar.capacidad:
                raise ValidationError(f"El '{self.lugar.nombre}' ya alcanzó su capacidad máxima ({self.lugar.capacidad}) de usuarios asignados en la jornada: {self.jornada.get_dia_display()} - {self.jornada.get_turno_display()}.")
        
    def save(self, *args, **kwargs):
        self.full_clean()  
        super().save(*args, **kwargs)
    



class ServicioDiagnostico(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    lugar = models.ManyToManyField(Lugar, related_name="servicios_diagnostico")
    nombre_servicio = models.CharField(max_length=255)
    descripcion = models.TextField()
    capacidad_diaria = models.PositiveIntegerField(null=True, blank=True) # Al finalizar la BD quitar el blank y el null
    
    def __str__(self):
        return f"ID servicio de diagnostico {self.id} - Nombre: {self.nombre_servicio} - Departamento: {self.departamento.nombre_departamento}"

class Especialidades(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE,  related_name="especialidades")
    nombre_especialidad = models.CharField(max_length=255)
    descripcion = models.TextField()
    permite_turno = models.BooleanField()
    capacidad_diaria = models.PositiveIntegerField(null=True, blank=True) # Al finalizar la BD quitar el blank y el null

    def __str__(self):
        return f"ID especialidad {self.id} - Nombre: {self.nombre_especialidad} - Departamento: {self.departamento.nombre_departamento}"

class EstudiosDiagnosticos(models.Model):
    TIPO_CHOICES = [
        ("img", "Imagen"),
        ("lab", "Laboratorio"),
        ("fisio", "Fisiológico"),
        ("eval", "Evaluación clínica")
    ]
    tipo_resultado = models.CharField(max_length=100, choices=TIPO_CHOICES)   # Sacarle el null y el blank al finalizar la BD
    especialidad = models.ManyToManyField(Especialidades,related_name="EspecialidadesDelEstudio")
    servicio_diagnostico = models.ForeignKey(ServicioDiagnostico, on_delete=models.CASCADE)
    nombre_estudio = models.CharField(max_length=200)  

    def __str__(self):
        return f"{self.id} - El estudio '{self.nombre_estudio}' se realiza en {self.servicio_diagnostico.nombre_servicio} - Tipo Resultado: ({self.get_tipo_resultado_display()})"

class PlantillaEstudio(models.Model):
    estudio = models.OneToOneField(EstudiosDiagnosticos, on_delete=models.CASCADE,related_name="plantilla")
    estructura = models.JSONField()  # 👈 Esto funciona APARTIR DE MySQL 5.7+
    
    def __str__(self):
        return f"El estudio '{self.estudio.nombre_estudio}' tiene la estructura {self.estructura}"


class Turno(models.Model):
    ESTADOS_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('cancelado', 'Cancelado'),
        ('atendido', 'Atendido'),
        ('noAsistio', 'No asistio'),
        ('reprogramado', 'Reprogramado'),
    ]
    TURNOS_CHOICES = [
        ('dia', 'Diurno(7:00 a 15:00)'),
        ('tarde', 'Vespertino(15:00 a 23:00)'),
        ('noche', 'Nocturno(23:00 a 7:00)'),
        ('on-call', 'Guardia'),
    ] 
    
    especialidad = models.ForeignKey(Especialidades, on_delete=models.CASCADE)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE, related_name="turnos")
    profesional = models.ForeignKey('controlUsuario.Usuario', on_delete=models.CASCADE)
    fecha_creacion = models.DateTimeField(auto_now_add=True) 
    fecha_turno = models.DateField() 
    horario_turno = models.CharField(max_length=10, choices=TURNOS_CHOICES, default="dia")  # Luego quitar el default al terminar a BD
    estado = models.CharField(max_length=20, choices=ESTADOS_CHOICES, default="pendiente")
    motivo = models.TextField(blank=True, null=False)
    asistio = models.BooleanField(default=False)
    lugar = models.ForeignKey(Lugar,on_delete=models.SET_NULL,null=True,blank=False)
    
    # Método para obtener la hora de inicio y fin del turno
    def obtener_rango_turno(self):
        if self.horario_turno == 'dia':
            hora_inicio = time(7, 0)  # 7:00 AM
            hora_fin = time(15, 0)    # 3:00 PM
        elif self.horario_turno == 'tarde':
            hora_inicio = time(15, 0) # 3:00 PM
            hora_fin = time(23, 0)    # 11:00 PM
        elif self.horario_turno == 'noche':
            hora_inicio = time(23, 0) # 11:00 PM
            hora_fin = time(7, 0)     # 7:00 AM (del día siguiente)
        elif self.horario_turno == 'on-call':
            hora_inicio = time(0, 0)  # Guardia 24h (desde la medianoche)
            hora_fin = time(23, 59)   # Hasta el final del día
        return hora_inicio, hora_fin
    
    def __str__(self):
        return f"ID turno: {self.id}, Estado: {self.get_estado_display()}"

class Consultas(models.Model):
    turno = models.ForeignKey(Turno, on_delete=models.CASCADE,related_name='consulta')
    diagnostico = models.TextField(blank=False, null=False) 
    tratamiento = models.TextField(blank=True, null=True)
    observaciones = models.TextField(blank=False, null=False)
    fecha = models.DateTimeField(auto_now_add=True)  
    
    def __str__(self):
        return f"Consulta del turno: {self.turno.id} - ID Consulta: {self.id} - Fecha de la consulta: {self.fecha}"

class OrdenEstudio(models.Model):
    ESTADOS_CHOICES = [
        ('pendiente', 'En espera de programación'),
        ('programado', 'Programado'),
        ('vencida', 'Orden vencida')
    ]
    tipo_estudio = models.ForeignKey(EstudiosDiagnosticos, on_delete=models.CASCADE, related_name='tipo_estudios')
    consulta = models.ForeignKey(Consultas, on_delete=models.CASCADE, related_name='estudios')
    motivo_estudio = models.TextField(blank=True, null=True)
    indicaciones = models.TextField(blank=True, null=True)
    fecha_solicitud = models.DateTimeField(auto_now_add=True,blank=True, null=True) 
    estado = models.CharField(max_length=20, choices=ESTADOS_CHOICES, default="pendiente")
    solicitado_por = models.ForeignKey('controlUsuario.Usuario', on_delete=models.CASCADE)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE, related_name="ordenesPaciente")

    @property
    def estado_detallado(self):
        if self.estado == "programado":
            turno = getattr(self, "turnoEstudio", None)
            if turno.estado == "pendiente":
                return f"Turno programado para {turno.fecha_turno.strftime('%d-%m-%Y')} | {turno.get_horarioTurnoEstudio()}"
            elif turno.estado == "realizado":
                if hasattr(turno, "resultado") and turno.resultado.archivo_pdf:
                    # URL hacia la vista que valida permisos
                    url_segura = reverse('ver_pdf_estudio', args=[turno.resultado.id])
                    return f"<a href='{url_segura}' target='_blank' class='btn-global'>Ver resultados</a>"
            else:
                return turno.get_estado_display()
        
        return self.get_estado_display()
    
    def __str__(self):
        return f'Solitud pedida en la consulta n°: {self.consulta.id} - N° de orden: {self.id} - Tipo Estudio: "{self.tipo_estudio.nombre_estudio}" - Estado: {self.estado} - Paciente ID: {self.paciente.id}'

class Medicaciones(models.Model):
    consulta = models.ForeignKey(Consultas, on_delete=models.CASCADE, related_name='medicaciones')
    medicamento = models.CharField(max_length=100, blank=True, null=True)
    dosis = models.CharField(max_length=100, blank=True, null=True)
    frecuencia = models.CharField(max_length=100, blank=True, null=True)
    tiempo_uso = models.CharField(max_length=255, blank=True, null=True)
    recetada_por = models.ForeignKey('controlUsuario.Usuario', on_delete=models.CASCADE )
    
    def __str__(self):
        return f"Medicamento: {self.medicamento}"


class TurnoEstudio(models.Model):
    ESTADOS_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('analisis', 'En análisis'),
        ('noAsistio', 'No asistio'),
        ('realizado', 'Realizado'),
    ]
    TURNOS_CHOICES = [
        ('dia', 'Diurno(7:00 a 15:00)'),
    ]     
    servicio_diagnostico = models.ForeignKey(ServicioDiagnostico, on_delete=models.CASCADE)  
    orden = models.OneToOneField(OrdenEstudio, on_delete=models.CASCADE, related_name="turnoEstudio")
    fecha_creacion = models.DateTimeField(auto_now_add=True) 
    fecha_turno = models.DateField() 
    horario_turno = models.CharField(max_length=10, choices=TURNOS_CHOICES, default="dia")
    estado = models.CharField(max_length=20, choices=ESTADOS_CHOICES, default="pendiente")
    lugar = models.ForeignKey(Lugar, on_delete=models.CASCADE)
    asistio = models.BooleanField(default=False)


    # Método para obtener la hora de inicio y fin del turno
    def obtener_rango_turno(self):
        if self.horario_turno == 'dia':
            hora_inicio = time(7, 0)  # 7:00 AM
            hora_fin = time(15, 0)    # 3:00 PM
        return hora_inicio, hora_fin
    
    def get_horarioTurnoEstudio(self):
        if self.horario_turno == "dia":
            return "07:00 - 15:00"
    
    def __str__(self):
        return f"Turno para {self.orden.tipo_estudio.nombre_estudio} el {self.fecha_turno} solicitado por el paciente: ({self.orden.consulta.turno.paciente.persona.get_full_name()} - DNI: {self.orden.consulta.turno.paciente.persona.dni}) - Estado: {self.get_estado_display()} "


class ResultadoImagen(models.Model):
    imagen = models.ImageField(upload_to="imagenes_temporales/")
    fecha_carga = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Imagen {self.id}"

class ResultadoEstudio(models.Model):
    turno_estudio = models.OneToOneField(TurnoEstudio, on_delete=models.CASCADE, related_name="resultado")
    informe = models.TextField()
    datos_especificos = models.JSONField(null=True, blank=True)  # 👈 Esto funciona APARTIR DE MySQL 5.7+
    archivo_pdf = models.FileField(upload_to='resultados/', null=True, blank=True)
    cargado_por = models.ForeignKey('controlUsuario.Usuario',on_delete=models.CASCADE)
    imagenes = models.ManyToManyField(ResultadoImagen, blank=True, related_name="resultados") # varias imágenes por estudio (solo para img)

    def __str__(self):
        return f"Resultado - {self.turno_estudio.orden.tipo_estudio.nombre_estudio} ({self.turno_estudio.orden.consulta.turno.paciente})"
    
