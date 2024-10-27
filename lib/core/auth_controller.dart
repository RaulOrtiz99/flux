import 'package:shelf/shelf.dart';
import '../core/auth_service.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthController {
  final AuthService _authService;

  AuthController(this._authService);

  Router get router {
    final router = Router();

    // Ruta para login
    router.post('/login', (Request request) async {
      final payload = await request.readAsString();
      final data = Uri.splitQueryString(payload);

      // Validación básica (en el futuro, conectar a base de datos)
      if (data['username'] == 'admin' && data['password'] == 'admin123') {
        final token = _authService.generateToken('1', 'admin');
        return Response.ok(token);
      } else {
        return Response.forbidden('Credenciales incorrectas');
      }
    });

    return router;
  }
}
