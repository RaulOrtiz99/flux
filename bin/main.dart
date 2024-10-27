import '../lib/core/app.dart';
import '../lib/core/auth_service.dart';
import 'package:flux/core/middleware.dart';
import '../lib/modules/example/example_module.dart';



void main() async {
  // Crear la clave secreta (debería ser configurada como variable de entorno en una aplicación real)
  final secretKey = 'super_secret_key';
  final authService = AuthService(secretKey);

  // Crear una instancia de la aplicación FluxApp e inyectar AuthService
  final app = FluxApp(authService);

  // Añadir middleware de autenticación para proteger las rutas
  app.addMiddleware(authenticationMiddleware(authService));

  // Añadir el módulo de ejemplo a la aplicación (/api)
  final exampleModule = ExampleModule();
  app.addModule('/api', exampleModule.router);

  // Iniciar la aplicación en el puerto 8080
  await app.start(port: 8080);
}
