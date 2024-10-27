import 'dart:io';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_router/shelf_router.dart';

void generate(String type, String name) {
  final basePath = Directory.current.path;

  switch (type) {
    case 'module':
    case 'm':
      print('Generando módulo "$name"...');
      _createModule(basePath, name);
      break;
    case 'controller':
    case 'c':
      print('Generando controlador "$name"...');
      _createController(basePath, name);
      break;
    case 'service':
    case 's':
      print('Generando servicio "$name"...');
      _createService(basePath, name);
      break;
    default:
      print('Tipo de estructura desconocido: $type');
  }
}

void _createModule(String basePath, String name) {
  try {
    final moduleDir = Directory('$basePath/lib/modules/$name');
    if (!moduleDir.existsSync()) {
      moduleDir.createSync(recursive: true);
      final moduleFile = File('${moduleDir.path}/${name}_module.dart');
      moduleFile.writeAsStringSync('''

class ${_capitalize(name)}Module {
  Router get router {
    final router = Router();
    // Definir rutas aquí
    return router;
  }
}
    ''');
      print('Módulo "$name" creado exitosamente en: ${moduleDir.path}');
    } else {
      print('El módulo "$name" ya existe en: ${moduleDir.path}');
    }
  } catch (e) {
    print('Error al crear el módulo "$name": $e');
  }
}

void _createController(String basePath, String name) {
  try {
    final controllerDir = Directory('$basePath/lib/modules/$name');
    if (!controllerDir.existsSync()) {
      print('Error: El módulo "$name" no existe. Por favor, crea el módulo primero.');
      return;
    }
    final controllerFile = File('${controllerDir.path}/${name}_controller.dart');
    controllerFile.writeAsStringSync('''

class ${_capitalize(name)}Controller {
  Router get router {
    final router = Router();
    // Definir rutas aquí
    return router;
  }
}
    ''');
    print('Controlador "$name" creado exitosamente en: ${controllerDir.path}');
  } catch (e) {
    print('Error al crear el controlador "$name": $e');
  }
}

void _createService(String basePath, String name) {
  try {
    final serviceDir = Directory('$basePath/lib/modules/$name');
    if (!serviceDir.existsSync()) {
      print('Error: El módulo "$name" no existe. Por favor, crea el módulo primero.');
      return;
    }
    final serviceFile = File('${serviceDir.path}/${name}_service.dart');
    serviceFile.writeAsStringSync('''
class ${_capitalize(name)}Service {
  // Métodos de servicio aquí
}
    ''');
    print('Servicio "$name" creado exitosamente en: ${serviceDir.path}');
  } catch (e) {
    print('Error al crear el servicio "$name": $e');
  }
}

String _capitalize(String input) {
  return input[0].toUpperCase() + input.substring(1);
}
