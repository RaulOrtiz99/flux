import 'dart:io';
import 'package:args/args.dart';
import 'package:dart_console/dart_console.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addCommand('create')
    ..addCommand('generate')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Muestra la ayuda');

  final ArgResults argResults = parser.parse(arguments);

  if (argResults['help'] == true) {
    print(parser.usage);
    exit(0);
  }

  if (argResults.command?.name == 'create') {
    final createArgs = argResults.command!;
    if (createArgs.rest.isNotEmpty && createArgs.rest[0] == 'project') {
      final projectName = createArgs.rest.length > 1 ? createArgs.rest[1] : null;

      if (projectName == null) {
        print('Por favor, proporciona un nombre para el proyecto.');
        exit(1);
      }

      createProject(projectName);
    } else {
      print('Comando no reconocido para create. Usa: flux create project "nombre del proyecto".');
    }
  }
}

void createProject(String projectName) {
  final console = Console();
  console.clearScreen();
  console.writeLine('Creando el proyecto "$projectName"...');

  // Base de datos opcional
  final options = ['PostgreSQL', 'MySQL', 'SQLite', 'Sin base de datos'];
  console.writeLine('Selecciona una base de datos para el proyecto:');

  // Variable para la selección actual del usuario
  int selectedIndex = 0;

  // Renderiza el menú de selección
  void renderMenu() {
    console.clearScreen();
    console.writeLine('Selecciona una base de datos para el proyecto:');
    for (int i = 0; i < options.length; i++) {
      if (i == selectedIndex) {
        console.setForegroundColor(ConsoleColor.blue);
        console.writeLine('> ${options[i]}'); // Opción seleccionada
        console.resetColorAttributes();
      } else {
        console.writeLine('  ${options[i]}');
      }
    }
  }

  // Renderizar el menú por primera vez
  renderMenu();

  // Manejar la entrada del usuario para navegar y seleccionar
  while (true) {
    final key = console.readKey();

    if (key.controlChar == ControlCharacter.arrowUp) {
      if (selectedIndex > 0) {
        selectedIndex--;
      }
      renderMenu();
    } else if (key.controlChar == ControlCharacter.arrowDown) {
      if (selectedIndex < options.length - 1) {
        selectedIndex++;
      }
      renderMenu();
    } else if (key.controlChar == ControlCharacter.enter) {
      break;
    }
  }

  final selectedDatabase = options[selectedIndex];
  console.writeLine('Has seleccionado: $selectedDatabase');

  // Crear directorios del proyecto
  final projectDir = Directory('./$projectName');
  if (projectDir.existsSync()) {
    console.writeLine('El proyecto "$projectName" ya existe.', TextAlignment.center);
    exit(1);
  }

  projectDir.createSync(recursive: true);
  Directory('${projectDir.path}/lib').createSync();
  Directory('${projectDir.path}/lib/core').createSync();
  Directory('${projectDir.path}/lib/modules').createSync();

  File('${projectDir.path}/pubspec.yaml').writeAsStringSync('''
name: $projectName
description: Un nuevo proyecto creado con Flux
version: 1.0.0

environment:
  sdk: ">=2.14.0 <3.0.0"

dependencies:
  shelf: ^1.3.0
  shelf_router: ^1.1.0
  ${selectedDatabase == 'PostgreSQL' ? 'postgres: ^2.4.0' : ''}
  ${selectedDatabase == 'MySQL' ? 'mysql1: ^0.18.0' : ''}
  ${selectedDatabase == 'SQLite' ? 'sqlite3: ^1.4.1' : ''}
  ''');

  console.writeLine('El proyecto "$projectName" ha sido creado exitosamente con la configuración seleccionada.');
}
