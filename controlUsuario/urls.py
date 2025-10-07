from django.urls import path
from . import views 

urlpatterns = [
    path("", views.iniciar_sesion, name="login"),
    path("registrarse/", views.signup, name="signup"),
    path("unauthorized/", views.unauthorized, name="unauthorized"),
    path("logout/", views.cerrar_sesion, name="logout")
]