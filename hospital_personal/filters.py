import django_filters
from .models import Lugar,Departamento
from hospital_pacientes.models import Paciente
from controlUsuario.models import Usuario,TiposUsuarios
from django import forms

class UsuarioFilter(django_filters.FilterSet):
    persona__login_id = django_filters.CharFilter(
        field_name='persona__login_id',
        lookup_expr='icontains',  # icontains:  buscar texto parcial  .  # exact : opción exacta
        label='N° Legajo:',
        widget=forms.NumberInput(attrs={'placeholder': 'Buscar por el N° Legajo...'})
    )    
    tipoUsuario = django_filters.ModelChoiceFilter(
        queryset=TiposUsuarios.objects.all(),
        label='Tipo usuario:',
        empty_label='-- Sin filtros --',  
    )
    numero_matricula = django_filters.NumberFilter(
        field_name='numero_matricula',
        lookup_expr='icontains',  # icontains:  buscar texto parcial  .  # exact : opción exacta
        label='N° Matricula:',
        widget=forms.NumberInput(attrs={'placeholder': 'Buscar por el N° Matricula...'})
    )   
    persona__first_name = django_filters.CharFilter(
        field_name='persona__first_name',
        lookup_expr='icontains',
        label='Nombre:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el nombre...'})
    )
    persona__last_name = django_filters.CharFilter(
        field_name='persona__last_name',
        lookup_expr='icontains',
        label='Apellido:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el apellido...'})
    )
    
    persona__is_active = django_filters.BooleanFilter(
        field_name='persona__is_active',
        label='Estado:',
        widget=forms.Select(choices=[('', '-- Sin filtros --'), ('True', 'Activo'), ('False', 'Inactivo')])
    )
    
    class Meta:
        model = Usuario
        fields = [
            'persona__login_id',  
            'tipoUsuario',  
            'numero_matricula',  
            'persona__first_name', 
            'persona__last_name', 
            'persona__is_active' 
        ]


class LugarFilter(django_filters.FilterSet):
    nombre = django_filters.CharFilter(
        field_name='nombre',
        lookup_expr='icontains',  # icontains:  buscar texto parcial  .  # exact : opción exacta
        label='Nombre:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el nombre...'})
    )    
    piso = django_filters.NumberFilter(
        field_name='piso',
        lookup_expr='exact',  # icontains:  buscar texto parcial  .  # exact : opción exacta
        label='Piso:',
        widget=forms.NumberInput(attrs={'placeholder': 'Buscar por N° de piso...'})
    )    
    sala = django_filters.NumberFilter(
        field_name='sala',
        lookup_expr='exact',  # icontains:  buscar texto parcial  .  # exact : opción exacta
        label='Sala:',
        widget=forms.NumberInput(attrs={'placeholder': 'Buscar por N° de sala...'})
    )    
    es_critico = django_filters.BooleanFilter(
        field_name='es_critico',
        label='Es critico:',
        widget=forms.Select(choices=[('', '-- Sin filtros --'), ('True', 'Sí'), ('False', 'No')])
    )
    activo = django_filters.BooleanFilter(
        field_name='activo',
        label='Esta activo:',
        widget=forms.Select(choices=[('', '-- Sin filtros --'), ('True', 'Sí'), ('False', 'No')])
    )
    departamento = django_filters.ModelChoiceFilter(
        queryset=Departamento.objects.all(),
        label='Departamento',
        empty_label='-- Sin filtros --',  
    )
    
    class Meta:
        model = Lugar
        fields = [
            'nombre',  
            'tipo',  
            'piso',  
            'sala', 
            'es_critico', 
            'activo',  
            'departamento',  
        ]
    

class PacienteFilter(django_filters.FilterSet):
    persona__dni = django_filters.CharFilter(
        field_name='persona__dni',
        lookup_expr='icontains',
        label='DNI:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el DNI...'})
    )
    persona__first_name = django_filters.CharFilter(
        field_name='persona__first_name',
        lookup_expr='icontains',
        label='Nombre:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el nombre...'})
    )
    persona__last_name = django_filters.CharFilter(
        field_name='persona__last_name',
        lookup_expr='icontains',
        label='Apellido:',
        widget=forms.TextInput(attrs={'placeholder': 'Buscar por el apellido...'})
    )
    
    persona__is_active = django_filters.BooleanFilter(
        field_name='persona__is_active',
        label='Estado:',
        widget=forms.Select(choices=[('', '-- Sin filtros --'), ('True', 'Activo'), ('False', 'Inactivo')])
    )
    
    RESPONSABLE_CHOICES = (
        ('', '-- Sin filtros --'),
        ('titular', 'Titular'),
        ('menor', 'Menor'),
    )
    
    responsable = django_filters.ChoiceFilter(
        choices=RESPONSABLE_CHOICES,
        method='filter_responsable',  # usamos un método custom
        label='Tipo paciente:',
        empty_label=None
    )    
    
    class Meta:
        model = Paciente
        fields = [
            'persona__dni',
            'persona__first_name',
            'persona__last_name',
            'persona__is_active',
            'responsable'
        ]
        
    def filter_responsable(self, queryset, name, value):  # Método custom que aplica el filtro
        if value == 'menor':
            return queryset.filter(responsable__isnull=False)
        elif value == 'titular':
            return queryset.filter(responsable__isnull=True)
        return queryset