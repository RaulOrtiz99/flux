import 'package:shelf/shelf.dart';
import 'package:flux/core/module.dart';
import 'package:shelf_router/shelf_router.dart';

class ExampleModule extends FluxModule {
  @override
  Router get router {
    final router = Router();

    // Aquí puedes definir algunas rutas de ejemplo
    router.get('/example', (request) {
      return Response.ok('Hello from ExampleModule');
    });

    return router;
  }
}
