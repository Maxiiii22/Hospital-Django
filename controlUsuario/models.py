from django.db import models
from django.core.exceptions import ValidationError
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser # AbstractUser es una clase base que proporciona todos los campos y comportamientos predeterminados de un usuario en Django,
                                                    # pero permite que los extiendas si lo necesitas, tambien incluye todo lo necesario para la autenticación, gestión de usuarios, permisos y demás, 
                                                    # y solo tienes que agregarle los campos adicionales que necesites. Basicamente es una clase que hereda de AbstractBaseUser y agrega todos los campos y
                                                    # métodos predeterminados del modelo User , para asi permitirnos personalizar el modelo User.
                                                    # La clase User ya tiene sus campos predefinidos y no se pueden agregar otros , por eso usamos AbstractUser.
# Campos de AbstractUser : username - first_name - last_name - email - password y demas . 
from hospital_personal.models import Especialidades,ServicioDiagnostico

# Create your models here.

##### Toda esta parte es para que todos los personas usen login_id en vez de username ######
class PersonaManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, login_id, password=None, **extra_fields):
        if not login_id:
            raise ValueError('El campo login_id es obligatorio')
        extra_fields.setdefault('is_active', True)
        user = self.model(login_id=login_id, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, login_id, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('El superusuario debe tener is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('El superusuario debe tener is_superuser=True.')

        return self.create_user(login_id, password, **extra_fields)
    
#############################################################################################

class TiposUsuarios(models.Model): 
    nombre_tipoUsuario = models.CharField(max_length=255)
    
    def __str__(self):
        return f"{self.nombre_tipoUsuario}"
    
class RolesProfesionales(models.Model):  
    nombre_rol_profesional = models.CharField(max_length=255)
    tipoUsuario = models.ForeignKey(TiposUsuarios,on_delete=models.CASCADE)
    especialidad = models.ForeignKey(Especialidades,on_delete=models.SET_NULL, blank=True, null=True)
    servicio_diagnostico = models.ForeignKey(ServicioDiagnostico,on_delete=models.SET_NULL, blank=True, null=True)
    
    def __str__(self):
        return f"{self.nombre_rol_profesional}"
    
    def clean(self):
        if self.especialidad and self.servicio_diagnostico:
            raise ValidationError("Un rol profesional no puede estar asignado a una especialidad y a un servicio de diagnóstico al mismo tiempo.")
        if not self.especialidad and not self.servicio_diagnostico:
            raise ValidationError("Un rol profesional debe estar asignado a una especialidad o a un servicio de diagnóstico.")
    
    def save(self, *args, **kwargs):
        self.clean()  
        super().save(*args, **kwargs)


class Persona(AbstractUser):
    # Gracias a AbstractUser ya se heredan estos campos :
    # first_name
    # last_name
    # password
    # last_login
    # is_active  (En nuestra tabla Persona este campo es : estado_persona)
    # date_joined  (En nuestra tabla Persona este campo es : fecha_alta)
    # is_staff
    # is_superuser
    
    SEXO_CHOICES = [
        ('M', 'Masculino'),
        ('F', 'Femenino'),
        ('O', 'Otro'),
    ]    
    
    username = None   # Eliminamos username porque usamos login_id en su lugar
    dni = models.CharField(max_length=8, unique=True)
    login_id = models.CharField(max_length=100, unique=True, null=True, blank=True)  # login_id guardara tanto los emails de los pacientes , como el legajo_hospitalario de los usuarios.
    fecha_nacimiento = models.DateField()
    sexo = models.CharField(max_length=10, choices=SEXO_CHOICES)
    telefono = models.CharField(max_length=20, blank=True, null=True,unique=True)
    

    USERNAME_FIELD = 'login_id'  # Esto le dice a Django qué campo usar para autenticar usuarios (es decir, con qué campo hacen login).
    REQUIRED_FIELDS = ['first_name', 'last_name',"fecha_nacimiento"]  # A REQUIRED_FIELDS Django lo usa cuando creás superusuarios. Se refiere a los campos que pedirá además de login_id y password.

    objects = PersonaManager()  # Usamos el manager personalizado

    def __str__(self):
        if self.login_id:
            return f"{self.get_full_name()} ({self.login_id}) - DNI: {self.dni}"
        else:
            return f"{self.get_full_name()} (Menor a cargo del DNI: {self.paciente.responsable.adulto.persona.dni})"
    
    class Meta: # Esto hace que en el admin diga "Personas" en lugar de "Users".
        verbose_name = "Persona"
        verbose_name_plural = "Personas"


class Usuario(models.Model):
    persona = models.OneToOneField(Persona, on_delete=models.CASCADE)
    numero_matricula = models.CharField(max_length=50, blank=True, null=True)
    debe_cambiar_contraseña = models.BooleanField(default=True)
    tipoUsuario = models.ForeignKey(TiposUsuarios, on_delete=models.PROTECT)
    
    # Queremos que los valores NO vacíos sean únicos, pero permitir múltiples registros vacíos o nulos.
    # No usamos solamente `unique=True` en numero_matricula porque:
    #   - Django trata "" como un valor real, y eso rompería la unicidad si hay más de un "".
    #   - Algunas bases de datos (como SQLite o MySQL) no permiten múltiples NULL con unique=True.
    # Por eso, validamos manualmente en `clean()` cuando el valor no está vacío.        
    def clean(self):
        super().clean()  # buena práctica: llamar al clean del padre
        if self.numero_matricula:
            qs = Usuario.objects.filter(numero_matricula=self.numero_matricula)
            if self.pk:
                qs = qs.exclude(pk=self.pk)
            if qs.exists():
                raise ValidationError({'numero_matricula': "Este número de matrícula ya está en uso."})

    
    def __str__(self):
        return f"Usuario: {self.id} - {self.persona.get_full_name()} - Legajo hospitalario: {self.persona.login_id}"

