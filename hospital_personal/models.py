from django.db import models
from controlUsuario.models import Usuario,RolesProfesionales
from hospital_pacientes.models import Paciente
from datetime import time


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
    
    def __str__(self):
        return f"Los dias {self.get_dia_display()} trabaja en el turno: {self.get_turno_display()} de este departamento"

class Lugar(models.Model):
    ESTADOS_CHOICES = [
        ('disponible', 'Disponible'),
        ('ocupado', 'Ocupado'),
        ('mantenimiento', 'En mantenimiento'),
        ('fuera_servicio', 'Fuera de servicio')
    ]
    TIPO_CHOICES = [
        ('lab', 'Laboratorio'),
        ('hab', 'Habitación'),
        ('qui', 'Quirófano'),
        ('cons', 'Consultorio'),
        ('oficina_resultados', 'Oficina de Resultados')
    ]
    
    nombre = models.CharField(max_length=100)
    tipo = models.CharField(max_length=50,choices=TIPO_CHOICES)
    piso = models.IntegerField()
    codigo = models.CharField(max_length=20, unique=True)
    estado = models.CharField(max_length=20,choices=ESTADOS_CHOICES,default='disponible')
    capacidad = models.IntegerField(default=1)
    descripcion = models.TextField(blank=True, null=True)
    es_critico = models.BooleanField(default=False)
    activo = models.BooleanField(default=True) 

    def __str__(self):
        if self.activo:
            return f"{self.nombre} ({self.codigo}) - Estado: {self.estado}"
        else:
            return f"{self.nombre} ({self.codigo}) - INACTIVO"

class UsuarioXDepartamentoXJornadaXLugar(models.Model):
    lugar = models.ForeignKey(Lugar, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    jornada = models.ForeignKey(Jorna_laboral, on_delete=models.CASCADE)
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['usuario', 'jornada'], name='unique_usuario_jornada') # Con UniqueConstraint, nos aseguramos de que un mismo usuario no pueda estar asignado a la misma jornada más de una vez, aunque sea en diferentes departamentos.
        ]
    
    def __str__(self):
        return f"El usuario ({self.usuario.id} - {self.usuario.persona.get_full_name()} - {self.usuario.rol} )  trabaja los dias {self.jornada.dia} en el Departamento: {self.departamento.nombre_departamento} en el horario: {self.jornada.turno}"


class ServicioDiagnostico(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    lugar = models.ManyToManyField(Lugar, related_name="servicios_diagnostico")
    nombre_servicio = models.CharField(max_length=255)
    descripcion = models.TextField()
    
    def __str__(self):
        return f"ID servicio de diagnostico {self.id} - Nombre: {self.nombre_servicio} - Departamento: {self.departamento.nombre_departamento}"

class Especialidades(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE,  related_name="especialidades")
    nombre_especialidad = models.CharField(max_length=255)
    descripcion = models.TextField()
    permite_turno = models.BooleanField()
    
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


class UsuarioXEspecialidadXServicioXrolesProfesionales(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE,related_name="especialidadesUsuario")
    especialidad = models.ForeignKey(Especialidades, on_delete=models.CASCADE)
    servicio_diagnostico = models.ForeignKey(ServicioDiagnostico, on_delete=models.CASCADE, null=True,blank=True)
    rol_profesional = models.ForeignKey(RolesProfesionales, on_delete=models.CASCADE)
    
    def __str__(self):
        if (self.servicio_diagnostico):
            return f"Usuario: {self.usuario.persona.get_full_name()} - N° Legajo: {self.usuario.persona.login_id} - Especialidad: {self.especialidad.nombre_especialidad} - N° Matricula: {self.usuario.numero_matricula} - Servicio en el trabaja: {self.servicio_diagnostico.nombre_servicio}"
        else:
            return f"Usuario: {self.usuario.persona.get_full_name()} - N° Legajo: {self.usuario.persona.login_id} - Especialidad: {self.especialidad.nombre_especialidad} - N° Matricula: {self.usuario.numero_matricula}"

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
    profesional = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    fecha_creacion = models.DateTimeField(auto_now_add=True) 
    fecha_turno = models.DateField() 
    horario_turno = models.CharField(max_length=10, choices=TURNOS_CHOICES, default="dia")
    estado = models.CharField(max_length=20, choices=ESTADOS_CHOICES, default="pendiente")
    motivo = models.TextField(blank=True, null=False)
    asistio = models.BooleanField(default=False)
    
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
        ('pendiente', 'Pendiente'),
        ('realizado', 'Realizado'),
        ('noRealizado', 'No realizado')
    ]
    tipo_estudio = models.ForeignKey(EstudiosDiagnosticos, on_delete=models.CASCADE, related_name='tipo_estudios')
    consulta = models.ForeignKey(Consultas, on_delete=models.CASCADE, related_name='estudios')
    motivo_estudio = models.TextField(blank=True, null=True)
    indicaciones = models.TextField(blank=True, null=True)
    fecha_solicitud = models.DateTimeField(auto_now_add=True,blank=True, null=True) 
    estado = models.CharField(max_length=20, choices=ESTADOS_CHOICES, default="pendiente")
    solicitado_por = models.ForeignKey(Usuario, on_delete=models.CASCADE)

    def __str__(self):
        return f'Solitud pedida en la consulta n°: {self.consulta.id} - N° de orden: {self.id} - Tipo Estudio: "{self.tipo_estudio.nombre_estudio}" - Estado: {self.estado} - Paciente ID: {self.consulta.turno.paciente.id}'

class Medicaciones(models.Model):
    consulta = models.ForeignKey(Consultas, on_delete=models.CASCADE, related_name='medicaciones')
    medicamento = models.CharField(max_length=100, blank=True, null=True)
    dosis = models.CharField(max_length=100, blank=True, null=True)
    frecuencia = models.CharField(max_length=100, blank=True, null=True)
    tiempo_uso = models.CharField(max_length=255, blank=True, null=True)
    recetada_por = models.ForeignKey(Usuario, on_delete=models.CASCADE )
    
    def __str__(self):
        return f"Medicamento: {self.medicamento}"


class TurnoEstudio(models.Model):
    ESTADOS_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('cancelado', 'Cancelado'),
        ('atendido', 'Atendido'),
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
    cargado_por = models.ForeignKey(Usuario,on_delete=models.CASCADE)
    imagenes = models.ManyToManyField(ResultadoImagen, blank=True, related_name="resultados") # varias imágenes por estudio (solo para img)

    def __str__(self):
        return f"Resultado - {self.turno_estudio.orden.tipo_estudio.nombre_estudio} ({self.turno_estudio.orden.consulta.turno.paciente})"
    
