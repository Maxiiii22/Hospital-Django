from django.shortcuts import redirect

#    Middleware que redirige a los usuarios que deben cambiar su contraseña hacia la vista de cambio de contraseña, evitando que naveguen a otras URLs.

class ForzarCambioPasswordMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        self.allowed_paths = [
            '/personal/cambiar-password/',
            '/admin/login/',
        ]

    def __call__(self, request):
        user = request.user
        path = request.path

        if user.is_authenticated:
            if hasattr(user, 'usuario') and user.usuario.debe_cambiar_contraseña:
                if path not in self.allowed_paths:
                    return redirect('/personal/cambiar-password/')

        return self.get_response(request)
