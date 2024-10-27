import 'dart:io';
import 'socket.dart';
import 'middleware.dart';
import 'auth_service.dart';
import 'auth_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

class FluxApp {
  final Router _router = Router();
  final AuthService _authService;

  // Constructor que recibe el AuthService como dependencia
  FluxApp(this._authService);

  // Método para agregar módulos al router principal
  void addModule(String prefix, Router moduleRouter) {
    _router.mount(prefix, moduleRouter);
  }

  // Método para agregar middleware global a la aplicación
  void addMiddleware(Middleware middleware) {
    _middlewares.add(middleware);
  }

  // Lista de middlewares a aplicar
  final List<Middleware> _middlewares = [];

  // Método para iniciar el servidor
  Future<void> start({int port = 8080}) async {
    // Añadir rutas necesarias
    _router.mount('/auth/', AuthController(_authService).router);
    _router.get('/ws', createWebSocketHandler()); // Añadir soporte para WebSocket

    // Configuración del pipeline para manejar middleware y peticiones
    var handler = Pipeline()
        .addMiddleware(logRequests()) // Añadir middleware para registrar solicitudes
        .addMiddleware(errorHandlerMiddleware()) // Añadir middleware para manejar errores
        .addHandler(_router); // Manejar todas las rutas usando el router principal

    // Añadir todos los middlewares adicionales que se hayan agregado a la lista de middlewares
    for (final middleware in _middlewares) {
      handler = Pipeline().addMiddleware(middleware).addHandler(handler);
    }

    try {
      // Iniciar el servidor HTTP
      final server = await serve(handler, InternetAddress.anyIPv4, port);
      print('Servidor escuchando en http://${server.address.host}:${server.port}');
    } catch (e) {
      print('Error al iniciar el servidor: $e');
    }
  }
}
