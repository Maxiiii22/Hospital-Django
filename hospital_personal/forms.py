from django import forms
from django.forms import modelformset_factory # permite trabajar con múltiples formularios del mismo tipo en una sola vista.
from .models import Especialidades,Departamento,Consultas, OrdenEstudio, Medicaciones,EstudiosDiagnosticos,ResultadoEstudio,ResultadoImagen,UsuarioLugarTrabajoAsignado,UsuarioRolProfesionalAsignado,Lugar,Jorna_laboral,ServicioDiagnostico,PlantillaEstudio,Turno,TurnoEstudio
from controlUsuario.models import TiposUsuarios,RolesProfesionales
from django.contrib import messages
from django.core.exceptions import ValidationError
import datetime



class FormEspecialidades(forms.ModelForm): 
    class Meta:
        model = Especialidades  # Este formulario esta basado sobre el modelo "Especialidades"
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_especialidad', 'descripcion','permite_turno',"capacidad_diaria",'departamento'
        ]
        widgets = {
            "nombre_especialidad" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre de la especialidad"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion"}),
            "permite_turno" : forms.CheckboxInput(attrs={'class': "campos-modal"}),
            "capacidad_diaria" : forms.NumberInput(attrs={'class': "campos-modal"}),
            "departamento" : forms.Select(attrs={'class': "campos-modal"})
        }

class FormDepartamentos(forms.ModelForm): 
    class Meta:
        model = Departamento  # Este formulario esta basado sobre el modelo "Departamento"
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_departamento', 'tipo', 'descripcion'
        ]
        widgets = {
            "nombre_departamento" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del departamento"}),
            "tipo" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el tipo"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion"}),
        }

class FormServiciosDiagnostico(forms.ModelForm): 
    class Meta:
        model = ServicioDiagnostico 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_servicio', 'descripcion', 'departamento',"capacidad_diaria","lugar"
        ]
        widgets = {
            "nombre_servicio" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del servicio de diagnostico"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion"}),
            "departamento" : forms.Select(attrs={'class': "campos-modal"}),
            "capacidad_diaria" : forms.NumberInput(attrs={'class': "campos-modal"}),
            "lugar" : forms.CheckboxSelectMultiple(attrs={'class': "box-multipleCheck"})
        }

class FormEstudiosDiagnosticos(forms.ModelForm): 
    class Meta:
        model = EstudiosDiagnosticos 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_estudio', 'especialidad', 'servicio_diagnostico',"tipo_resultado"
        ]
        widgets = {
            "nombre_estudio" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del estudio"}),
            "especialidad" : forms.CheckboxSelectMultiple(attrs={'class': "box-multipleCheck"}),
            "servicio_diagnostico" : forms.Select(attrs={'class': "campos-modal"}),
            "tipo_resultado" : forms.Select(attrs={'class': "campos-modal"})
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Personalizando los labels de los ForeignKey en el formulario
        self.fields['servicio_diagnostico'].queryset = ServicioDiagnostico.objects.all()
        self.fields['especialidad'].queryset = Especialidades.objects.all()
        
        # Cambiar el texto que aparece en el Select sin cambiar el __str__ del modelo
        self.fields['servicio_diagnostico'].label_from_instance = lambda obj: f"{obj.nombre_servicio}" 
        self.fields['especialidad'].label_from_instance = lambda obj: f"{obj.nombre_especialidad}" 

class FormLugar(forms.ModelForm): 
    class Meta:
        model = Lugar 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre', 'tipo', 'piso',"sala","abreviacion","capacidad","departamento","descripcion","es_critico","activo"
        ]
        widgets = {
            "nombre" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del lugar"}),
            "tipo" : forms.Select(attrs={'class': "campos-modal"}),
            "piso" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el piso en el que esta ubicado el lugar"}),
            "sala" : forms.NumberInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el N° de sala"}),
            "abreviacion" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese la abreviación del nombre del lugar"}),
            "capacidad" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese la capacidad del lugar"}),
            "departamento" : forms.Select(attrs={'class': "campos-modal"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion del lugar"}),
            "es_critico" : forms.CheckboxInput(attrs={'class': "campos-modal"}),
            "activo" : forms.CheckboxInput(attrs={'class': "campos-modal"})
        }
        


class FormPlantillaEstudio(forms.ModelForm): 
    class Meta:
        model = PlantillaEstudio 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            "estudio","estructura"
        ]
        widgets = {
            "estudio" : forms.Select(attrs={'class': "campos-modal"}),
            "estructura" : forms.Textarea(attrs={'class': "campos-modal",'placeholder':"Ingrese la estructura en formato JSON del estudio"}),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Personalizando los labels de los ForeignKey en el formulario
        self.fields['estudio'].queryset = EstudiosDiagnosticos.objects.all()
        
        # Cambiar el texto que aparece en el Select sin cambiar el __str__ del modelo
        self.fields['estudio'].label_from_instance = lambda obj: f"{obj.nombre_estudio}" 


class FormTiposUsuarios(forms.ModelForm): 
    class Meta:
        model = TiposUsuarios  
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_tipoUsuario'
        ]
        widgets = {
            "nombre_tipoUsuario" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nuevo tipo de usuario"})
        }

class FormRolesProfesionales(forms.ModelForm): 
    class Meta:
        model = RolesProfesionales  
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_rol_profesional',"tipoUsuario","especialidad","servicio_diagnostico"
        ]
        widgets = {
            "nombre_rol_profesional" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del rol"}),
            "tipoUsuario" : forms.Select(attrs={'class': "campos-modal"}),
            "especialidad" : forms.Select(attrs={'class': "campos-modal"}),
            "servicio_diagnostico" : forms.Select(attrs={'class': "campos-modal"})
        }
        

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if 'especialidad' in self.fields:
            self.fields['especialidad'].queryset = Especialidades.objects.all()
            self.fields['especialidad'].label_from_instance = lambda obj: f"{obj.nombre_especialidad}"

        if 'servicio_diagnostico' in self.fields:
            self.fields['servicio_diagnostico'].queryset = ServicioDiagnostico.objects.all()
            self.fields['servicio_diagnostico'].label_from_instance = lambda obj: f"{obj.nombre_servicio}"



class FormularioLugarTrabajo(forms.Form): # Cambiar el formulario base de ModelForm a Form Porque ModelForm espera que cada campo del modelo tenga correspondencia exacta en el formulario y en este caso eso no se cumple ya que vamos a manejar "jornada" como si fuera una relacion ManyToMany pese a que sea FK.
    rolProfesionalAsignado = forms.ModelChoiceField(
        queryset=UsuarioRolProfesionalAsignado.objects.all(),
        widget=forms.Select(attrs={"class": "campos-modal"}),
        label="Rol profesional"
    )
    lugar = forms.ModelChoiceField(
        queryset=Lugar.objects.all(),
        widget=forms.Select(attrs={"class": "campos-modal"}),
        label="Lugar"
    )
    jornada = forms.ModelMultipleChoiceField( # Seleccionar varias jornadas
        queryset=Jorna_laboral.objects.all(),
        widget=forms.CheckboxSelectMultiple(attrs={"class": "box-multipleCheck"}), # Seleccionar varias jornadas
        label="Jornadas"
    )


    def __init__(self, *args, **kwargs):
        self.usuario = kwargs.pop('usuario', None)  # Pasar usuario desde la vista
        super().__init__(*args, **kwargs)
        
        if not self.usuario:
            raise ValueError("Se requiere un usuario para inicializar el formulario.")
        
        tipo_usuario = self.usuario.tipoUsuario.id
        
        if tipo_usuario == 1:  # Superadmin
            pass
        elif tipo_usuario == 2:  # Admin
            pass
        elif tipo_usuario == 3: # Medicos
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["cons","qui","proc"],activo=True) #Los médicos trabajan en consultorios, quirófanos y pueden realizar procedimientos ambulatorios no quirúrgicos
        elif tipo_usuario == 4: # Enfermeros
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["hab","unidad_atenc"],activo=True)  # Los enfermeros se desempeñan principalmente en internación y unidades de atención
        elif tipo_usuario == 5: # Apoyo en Diagnóstico y Tratamiento (Radiologos,ecografista,tecnico en laboratorio , etc  )
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["lab", "img","diag_func","unidad_atenc","proc"], activo=True)  # Laboratorios 
        elif tipo_usuario == 6: # Cargador de resultados
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo="area_apoyo",activo=True)  

        self.fields['rolProfesionalAsignado'].queryset = UsuarioRolProfesionalAsignado.objects.filter(usuario=self.usuario) 
        self.fields['rolProfesionalAsignado'].label_from_instance = lambda obj: f"{obj.rol_profesional}"
        self.fields['lugar'].label_from_instance = lambda obj: f"{obj.nombre} ({obj.abreviacion}) - Departamento: {obj.departamento}"
        self.fields['jornada'].label_from_instance = lambda obj: f"{obj.get_dia_display()} - {obj.get_turno_display()}"
        
    def clean(self):
        cleaned_data = super().clean()
        lugar = cleaned_data.get('lugar')
        jornadas = cleaned_data.get('jornada')

        if not lugar or not jornadas:
            return cleaned_data

        errores = []

        for jornada in jornadas:
            # Verificamos si el usuario ya tiene esa jornada asignada
            ya_asignado = UsuarioLugarTrabajoAsignado.objects.filter(
                usuario=self.usuario,
                jornada=jornada
            ).exists()

            if ya_asignado:
                continue  # No intentaremos asignarlo de nuevo

            # Verificamos la cantidad de usuarios asignados a ese lugar en esa jornada
            usuarios_en_jornada = UsuarioLugarTrabajoAsignado.objects.filter(
                lugar=lugar,
                jornada=jornada
            ).count()
            
            if usuarios_en_jornada >= lugar.capacidad:
                errores.append(
                    f"El lugar '{lugar.nombre} ({lugar.codigo})' ya alcanzó su capacidad máxima ({lugar.capacidad}) de usuarios asignados en la jornada: {jornada.get_dia_display()} - {jornada.get_turno_display()}."
                )

        if errores:
            raise forms.ValidationError(errores)

        return cleaned_data

    def save(self):
        lugar = self.cleaned_data['lugar']
        jornadas = self.cleaned_data['jornada']
        rolProfesional = self.cleaned_data.get('rolProfesionalAsignado')

        registros_creados = []
        jornadas_omitidas = []
        
        for jornada in jornadas:
            existe = UsuarioLugarTrabajoAsignado.objects.filter( # Validamos que el usuario no tenga asinado esa jornada
                usuario=self.usuario,
                jornada=jornada
            ).exists()
            
            if not existe:
                obj, creado = UsuarioLugarTrabajoAsignado.objects.get_or_create(
                    usuario=self.usuario,
                    rolProfesionalAsignado =rolProfesional,
                    lugar=lugar,
                    jornada=jornada
                )
                if creado:
                    registros_creados.append(obj)
            else:
                jornadas_omitidas.append(jornada)
            
        return registros_creados, jornadas_omitidas

class FormularioEditarLugarTrabajo(forms.ModelForm):
    class Meta:
        model = UsuarioLugarTrabajoAsignado
        fields = ['lugar', 'jornada','rolProfesionalAsignado']
        widgets = {
            "rolProfesionalAsignado": forms.Select(attrs={"class": "campos-modal", "id":"id_rol_edit"}),
            "lugar": forms.Select(attrs={"class": "campos-modal", "id":"id_lugar_edit"}),
            "jornada": forms.Select(attrs={"class": "campos-modal", "id":"id_jornada_edit"})
        }

    def __init__(self, *args, **kwargs):
        self.usuario = kwargs.pop('usuario', None) 
        super().__init__(*args, **kwargs)
        
        if not self.usuario:
            raise ValueError("Se requiere un usuario para inicializar el formulario.")
        
        tipo_usuario = self.usuario.tipoUsuario.id
        
        if tipo_usuario == 1:  # Superadmin
            pass
        elif tipo_usuario == 2:  # Admin
            pass
        elif tipo_usuario == 3: # Medicos
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["cons","qui","proc"],activo=True) #Los médicos trabajan en consultorios, quirófanos y pueden realizar procedimientos ambulatorios no quirúrgicos
        elif tipo_usuario == 4: # Enfermeros
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["hab","unidad_atenc"],activo=True)  # Los enfermeros se desempeñan principalmente en internación y unidades de atención
        elif tipo_usuario == 5: # Apoyo en Diagnóstico y Tratamiento (Radiologos,ecografista,tecnico en laboratorio , etc  )
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo__in=["lab", "img","diag_func","unidad_atenc","proc"], activo=True)  # Laboratorios 
        elif tipo_usuario == 6: # Cargador de resultados
            self.fields['lugar'].queryset = Lugar.objects.filter(tipo="area_apoyo",activo=True)  

        self.fields['rolProfesionalAsignado'].queryset = UsuarioRolProfesionalAsignado.objects.filter(usuario=self.usuario) 
        self.fields['rolProfesionalAsignado'].label_from_instance = lambda obj: f"{obj.rol_profesional}"
        self.fields['lugar'].label_from_instance = lambda obj: f"{obj.nombre} ({obj.abreviacion}) - Departamento: {obj.departamento}"
        self.fields['jornada'].label_from_instance = lambda obj: f"{obj.get_dia_display()} - {obj.get_turno_display()}"

    def clean(self):
        cleaned_data = super().clean()
        lugar = cleaned_data.get("lugar")
        jornada = cleaned_data.get("jornada")

        if not lugar or not jornada:
            return cleaned_data

        # Validación de jornada duplicada
        if self.instance.pk:
            conflicto = UsuarioLugarTrabajoAsignado.objects.filter(
                usuario=self.usuario,
                jornada=jornada
            ).exclude(pk=self.instance.pk).exists()
            if conflicto:
                self.add_error("jornada", "Este usuario ya tiene asignada esa jornada en otro lugar.")

        # Validación de capacidad del lugar
        asignaciones = UsuarioLugarTrabajoAsignado.objects.filter(lugar=lugar,jornada=jornada)
        if self.instance.pk:
            asignaciones = asignaciones.exclude(pk=self.instance.pk)

        if asignaciones.count() >= lugar.capacidad:
            self.add_error("lugar", f"El lugar '{lugar.nombre}' ya alcanzó su capacidad máxima de {lugar.capacidad} usuarios.")

        return cleaned_data





class FormularioAsignaciones(forms.ModelForm): 
    class Meta:
        model = UsuarioRolProfesionalAsignado 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'rol_profesional'
        ]
        widgets = {
            "rol_profesional" : forms.Select(attrs={"class":"campos-modal"}),
        }
    
    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        super(FormularioAsignaciones, self).__init__(*args, **kwargs)
        
        tipo_usuario = self.user.tipoUsuario.id
        
        # Roles ya asignados al usuario
        roles_asignados = UsuarioRolProfesionalAsignado.objects.filter(usuario=self.user).values_list('rol_profesional_id', flat=True)

        # Excluir los roles ya asignados
        self.fields['rol_profesional'].queryset = RolesProfesionales.objects.filter(tipoUsuario_id=tipo_usuario).exclude(id__in=roles_asignados)
        self.fields['rol_profesional'].label_from_instance = lambda obj: f"{obj.nombre_rol_profesional}" 



class FormConsulta(forms.ModelForm):
    class Meta:
        model = Consultas
        fields = ['diagnostico', 'tratamiento', 'observaciones']
        widgets = {
            'diagnostico': forms.Textarea(attrs={'class': 'form-control', 'rows': 1, "placeholder":"Diagnóstico principal..."}),
            'observaciones': forms.Textarea(attrs={'class': 'form-control', 'rows': 1, "placeholder":"Hallazgos, examen físico, evolución..."}),
            'tratamiento': forms.Textarea(attrs={'class': 'form-control', 'rows': 1, "placeholder":"Recomendaciones, dieta, actividad..."})
        }

class FormEstudio(forms.ModelForm):
    class Meta:
        model = OrdenEstudio
        fields = ['tipo_estudio', "motivo_estudio","indicaciones"]
        widgets = {
            'motivo_estudio': forms.Textarea(attrs={'rows': 1, 'placeholder': 'Sospecha de...'}),
            'indicaciones': forms.Textarea(attrs={'rows': 1, 'placeholder': 'Ej. En ayunas'}),
        }
    
    def __init__(self, *args, **kwargs):  
        super().__init__(*args, **kwargs)
        self.fields['tipo_estudio'].label_from_instance = lambda obj: obj.nombre_estudio # Esto hace que en el <select> aparezca siempre nombre_estudio, sin importar el __str__.
    
    # Hacer los campos opcionales
    tipo_estudio = forms.ModelChoiceField(
        queryset=EstudiosDiagnosticos.objects.all(),
        required=False,
        widget=forms.Select()
    )
    
    def clean(self):
        cleaned_data = super().clean()
        tipo = cleaned_data.get('tipo_estudio')
        motivo = cleaned_data.get('motivo_estudio')
        indicaciones = cleaned_data.get('indicaciones')

        # Validación condicional: si se completa algún campo, los demás son requeridos
        if tipo or motivo or indicaciones:
            if not tipo:
                self.add_error('tipo_estudio', 'Este campo es obligatorio si se completan otros.')
            if not motivo:
                self.add_error('motivo_estudio', 'Este campo es obligatorio si se completan otros.')
            if not indicaciones:
                self.add_error('indicaciones', 'Este campo es obligatorio si se completan otros.')

class FormMedicacion(forms.ModelForm):
    class Meta:
        model = Medicaciones
        fields = ['medicamento', 'dosis', 'frecuencia', 'tiempo_uso']
        widgets = {
            'medicamento': forms.TextInput(attrs={'placeholder': 'Ej: Paracetamol'}),
            'dosis': forms.TextInput(attrs={'placeholder': 'Ej: 500mg'}),
            'frecuencia': forms.TextInput(attrs={'placeholder': 'Ej: Cada 8 horas'}),
            'tiempo_uso': forms.TextInput(attrs={'placeholder': 'Ej: usuar durante 7 dias'})
        }
    
    def clean(self):
        cleaned_data = super().clean()
        medicamento = cleaned_data.get('medicamento')
        dosis = cleaned_data.get('dosis')
        frecuencia = cleaned_data.get('frecuencia')
        tiempo_uso = cleaned_data.get('tiempo_uso')

        if medicamento or dosis or frecuencia or tiempo_uso:
            if not medicamento:
                self.add_error('medicamento', 'Este campo es obligatorio si se completan otros.')
            if not dosis:
                self.add_error('dosis', 'Este campo es obligatorio si se completan otros.')
            if not frecuencia:
                self.add_error('frecuencia', 'Este campo es obligatorio si se completan otros.')
            if not tiempo_uso:
                self.add_error('tiempo_uso', 'Este campo es obligatorio si se completan otros.')

# Permite agregar múltiples estudios por consulta
EstudiosFormSet = modelformset_factory(
    OrdenEstudio, 
    form=FormEstudio,
    extra=1,  # indica que por defecto se muestra 1 formulario vacío. Cambialo a 2 o 3 si querés que aparezcan más.
    can_delete=True  # agrega una opción para eliminar formularios en el template (útil para descartar una línea).
)

# Permite agregar múltiples medicaciones por consulta
MedicacionesFormSet = modelformset_factory(
    Medicaciones,
    form=FormMedicacion,
    extra=1,
    can_delete=True
)

class ResultadoEstudioForm(forms.ModelForm):
    class Meta:
        model = ResultadoEstudio
        fields = ["informe"]  # solo informe fijo, los demás campos se agregan dinámicamente
        widgets = {
            "informe": forms.Textarea(attrs={"rows": 5,"placeholder":"Escribe el informe aquí si corresponde..."}),
        }
        
    def __init__(self, *args, **kwargs):
        self.turno = kwargs.pop("turno", None)
        super().__init__(*args, **kwargs)

        self.estructura = {}  # guardamos para usar luego en save()
        if self.turno:
            plantilla = getattr(self.turno.orden.tipo_estudio, "plantilla", None)
            if plantilla:
                self.estructura = plantilla.estructura.get(self.turno.orden.tipo_estudio.nombre_estudio, {})
                tipo = self.turno.orden.tipo_estudio.tipo_resultado
                if tipo == "lab":
                    # Generar dinámicamente un campo para cada parámetro del estudio
                    for parametro, detalles in self.estructura.items():
                        self.fields[parametro] = forms.CharField( # Creamos un campo para el valor de cada parámetro
                            label=f'Nombre: {parametro} - Unidad: {detalles.get("unidad","")} - Rango de referencia: {detalles.get("referencia","")}',
                            required=False,
                            widget=forms.TextInput(attrs={"placeholder": f"Ingrese valor de {parametro}"})
                        ) 
                elif tipo == "fisio":
                    for parametro, detalles in self.estructura.items():
                        self.fields[f"{parametro}_valor"] = forms.CharField(
                                label=f'Nombre: {parametro} - Unidad: {detalles.get("unidad","")} - Referencia: {detalles.get("referencia","")}',                               
                                required=False,
                                widget=forms.TextInput(attrs={"placeholder": f"Ingrese valor de {parametro}"})
                            )
                        self.fields[f"{parametro}_interpretacion"] = forms.CharField(
                            required=False,
                            widget=forms.TextInput(attrs={"placeholder": f"Ingrese interpretación de {parametro}"})
                        )
            
    def save(self, commit=True):
        instance = super().save(commit=False)

        datos = {}
        tipo = self.turno.orden.tipo_estudio.tipo_resultado

        for parametro, detalles in self.estructura.items():
            if tipo == "lab":
                valor = self.cleaned_data.get(parametro, "")
                datos[parametro] = {
                    "valor": valor,
                    "unidad": detalles.get("unidad", ""),
                    "referencia": detalles.get("referencia", "")
                }
            elif tipo == "fisio":
                valor = self.cleaned_data.get(f"{parametro}_valor", "")
                interpretacion = self.cleaned_data.get(f"{parametro}_interpretacion", "")
                datos[parametro] = {
                    "valor": valor,
                    "unidad": detalles.get("unidad", ""),
                    "referencia": detalles.get("referencia", ""),
                    "interpretacion": interpretacion
                }

        instance.datos_especificos = datos
        if commit:
            instance.save()
        return instance


class ResultadoImagenForm(forms.ModelForm):
    class Meta:
        model = ResultadoImagen
        fields = ["imagen"] 



class FormSacarTurno(forms.ModelForm):
    class Meta:
        model = Turno
        fields = ['fecha_turno', 'horario_turno', 'motivo', 'lugar','especialidad','paciente','profesional']
        widgets = {
            'motivo': forms.Textarea(attrs={'placeholder': 'Motivo del turno...', "class":"textarea-motivo-turno","cols":"0","rows":"0"}),
            'especialidad': forms.HiddenInput(),
            'profesional': forms.HiddenInput(),
            'paciente': forms.HiddenInput(),
            'fecha_turno': forms.HiddenInput(),
            'horario_turno': forms.HiddenInput(),
            'lugar': forms.HiddenInput()
        }
    
    def clean_fecha_turno(self):
        fecha = self.cleaned_data.get('fecha_turno')
        if fecha <= datetime.date.today():
            raise forms.ValidationError("No se puede seleccionar una fecha pasada.")
        return fecha    

class FormSacarTurnoEstudio(forms.ModelForm):
    class Meta:
        model = TurnoEstudio
        fields = ['fecha_turno', 'horario_turno', 'lugar','orden','servicio_diagnostico']
        widgets = {
            'orden': forms.HiddenInput(),
            'servicio_diagnostico': forms.HiddenInput(),
            'fecha_turno': forms.HiddenInput(attrs={"id": "fecha_seleccionada"}),
            'horario_turno': forms.HiddenInput(),
            'lugar': forms.HiddenInput()
        }
    
    def clean_fecha_turno(self):
        fecha = self.cleaned_data.get('fecha_turno')
        if fecha <= datetime.date.today():
            raise forms.ValidationError("No se puede seleccionar una fecha pasada.")
        return fecha    