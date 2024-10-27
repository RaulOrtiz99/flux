import 'package:shelf/shelf.dart';
import 'package:flux/core/auth_service.dart';

Middleware authenticationMiddleware(AuthService authService) {
  return (Handler innerHandler) {
    return (Request request) async {
      try {
        // Obtener el token del encabezado 'Authorization'
        final authHeader = request.headers['Authorization'];
        if (authHeader == null || !authHeader.startsWith('Bearer ')) {
          return Response.forbidden('Falta el token de autenticación o no es válido.');
        }

        final token = authHeader.substring(7); // Eliminar 'Bearer ' del encabezado
        if (!authService.verifyToken(token)) {
          return Response.forbidden('Token inválido o no autorizado.');
        }

        return await innerHandler(request);
      } catch (e) {
        return Response.internalServerError(
          body: 'Error inesperado durante la autenticación: $e',
        );
      }
    };
  };
}
// Middleware para manejar errores en general
Middleware errorHandlerMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      try {
        return await innerHandler(request);
      } catch (error, stackTrace) {
        print('Error: $error');
        print('StackTrace: $stackTrace');
        return Response.internalServerError(
          body: 'Ha ocurrido un error inesperado en el servidor.',
        );
      }
    };
  };
}

// Lógica de validación de token
bool isValidToken(String token) {
  // Implementar lógica real de validación del token, por ejemplo usando JWT
  return token == "valid-token"; // Placeholder: implementar validación real
}
