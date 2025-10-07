from functools import wraps
from django.shortcuts import redirect

def paciente_required(view_func):
    """
    Solo permitirá el acceso a la vista si el usuario es un paciente.
    """
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if hasattr(request.user, 'paciente'):
            return view_func(request, *args, **kwargs)
        else:
            return redirect("unauthorized")  # Redirige a una página de acceso denegado
    return _wrapped_view


def personal_required(view_func):
    """
    Solo permitirá el acceso a la vista si el usuario es personal.
    """
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if hasattr(request.user, 'usuario'):
            return view_func(request, *args, **kwargs)
        else:
            return redirect("unauthorized")  # Redirige a una página de acceso denegado
    return _wrapped_view
