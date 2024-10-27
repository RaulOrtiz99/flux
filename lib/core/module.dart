import 'package:shelf_router/shelf_router.dart';

abstract class Module {
  Router get router;
}

class FluxModule extends Module {
  @override
  Router get router => Router();
}
