from django import forms
from django.forms import modelformset_factory # permite trabajar con múltiples formularios del mismo tipo en una sola vista.
from .models import Especialidades,Departamento,Consultas, OrdenEstudio, Medicaciones,EstudiosDiagnosticos,ResultadoEstudio,ResultadoImagen,UsuarioXDepartamentoXJornadaXLugar,UsuarioXEspecialidadXServicioXrolesProfesionales,Lugar,Jorna_laboral,ServicioDiagnostico,PlantillaEstudio
from controlUsuario.models import TiposUsuarios,RolesProfesionales


class FormEspecialidades(forms.ModelForm): 
    class Meta:
        model = Especialidades  # Este formulario esta basado sobre el modelo "Especialidades"
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'nombre_especialidad', 'descripcion','permite_turno', 'departamento'
        ]
        widgets = {
            "nombre_especialidad" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre de la especialidad"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion"}),
            "permite_turno" : forms.CheckboxInput(attrs={'class': "campos-modal"}),
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
            'nombre_servicio', 'descripcion', 'departamento',"lugar"
        ]
        widgets = {
            "nombre_servicio" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del servicio de diagnostico"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion"}),
            "departamento" : forms.Select(attrs={'class': "campos-modal"}),
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
            'nombre', 'tipo', 'piso',"codigo","estado","capacidad","descripcion","es_critico","activo"
        ]
        widgets = {
            "nombre" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del lugar"}),
            "tipo" : forms.Select(attrs={'class': "campos-modal"}),
            "piso" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el piso en el que esta ubicado el lugar"}),
            "codigo" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el codigo del lugar"}),
            "estado" : forms.Select(attrs={'class': "campos-modal"}),
            "capacidad" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese la capacidad del lugar"}),
            "descripcion" : forms.Textarea(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese una descripcion del lugar"}),
            "es_critico" : forms.CheckboxInput(attrs={'class': "campos-modal"}),
            "activo" : forms.CheckboxInput(attrs={'class': "campos-modal"}),
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
            'nombre_rol_profesional',"tipoUsuario"
        ]
        widgets = {
            "nombre_rol_profesional" : forms.TextInput(attrs={'class': "campos-modal",'autofocus':"", 'placeholder':"Ingrese el nombre del rol"}),
            "tipoUsuario" : forms.Select(attrs={'class': "campos-modal"})
        }


class FormularioLugarTrabajo(forms.ModelForm): 
    class Meta:
        model = UsuarioXDepartamentoXJornadaXLugar  
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'lugar',"jornada",'departamento'
        ]
        widgets = {
            "lugar" : forms.Select(attrs={"class":"campos-modal"}),
            "jornada" : forms.Select(attrs={"class":"campos-modal"}),
            "departamento" : forms.Select(attrs={"class":"campos-modal"}),
        }
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Personalizando los labels de los ForeignKey en el formulario
        self.fields['lugar'].queryset = Lugar.objects.all()
        self.fields['jornada'].queryset = Jorna_laboral.objects.all()
        self.fields['departamento'].queryset = Departamento.objects.all()

        # Cambiar el texto que aparece en el Select sin cambiar el __str__ del modelo
        self.fields['lugar'].label_from_instance = lambda obj: f"{obj.nombre} ({obj.codigo})" 
        self.fields['jornada'].label_from_instance = lambda obj: f"{obj.get_dia_display()} - {obj.get_turno_display()}" 
        self.fields['departamento'].label_from_instance = lambda obj: f"{obj.nombre_departamento}"  

class FormularioAsignaciones(forms.ModelForm): 
    class Meta:
        model = UsuarioXEspecialidadXServicioXrolesProfesionales 
        fields = [ # Acá ingresamos los campos que queremos que se muestren en el formulario.
            'especialidad',"servicio_diagnostico",'rol_profesional'
        ]
        widgets = {
            "especialidad" : forms.Select(attrs={"class":"campos-modal"}),
            "servicio_diagnostico" : forms.Select(attrs={"class":"campos-modal"}),
            "rol_profesional" : forms.Select(attrs={"class":"campos-modal"}),
        }
    
    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        super(FormularioAsignaciones, self).__init__(*args, **kwargs)
        
        tipo_usuario = self.user.tipoUsuario.id

        # Si el rol del usuario es el rol que no debería ver 'servicio_diagnostico', solo mostrar 'especialidad' y 'rol_profesional'
        if tipo_usuario == 5:  # Si el rol del usuario es "Apoyo en Diagnóstico y Tratamiento"
            self.fields['especialidad'].widget = forms.HiddenInput()
            self.fields['servicio_diagnostico'].queryset = ServicioDiagnostico.objects.all()
        elif tipo_usuario == 3:  # Si el rol del usuario es "Medico"
            self.fields['servicio_diagnostico'].widget = forms.HiddenInput()
            self.fields['especialidad'].queryset = Especialidades.objects.all()

        # Filtramos el 'rol_profesional' según el tipo de usuario
        self.fields['rol_profesional'].queryset = RolesProfesionales.objects.filter(tipoUsuario_id=self.user.tipoUsuario.id)

        # Personalizamos las etiquetas (labels) de los campos
        self.fields['especialidad'].label_from_instance = lambda obj: f"{obj.nombre_especialidad}"
        self.fields['servicio_diagnostico'].label_from_instance = lambda obj: f"{obj.nombre_servicio}"
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



