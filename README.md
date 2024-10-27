# 🚀 Bienvenido a **Flux**: El Framework Backend Modular en Dart 🌟

**Flux** es un framework backend escrito en **Dart**, inspirado en la arquitectura modular y amigable de **NestJS**. Nuestro objetivo es simplificar la creación de APIs robustas, escalables, y divertidas de construir, ¡todo mientras nos aseguramos de que el proceso sea tan fluido como el propio nombre sugiere! 🌊✨

## ¿Por qué se llama **Flux**?

El nombre **Flux** proviene del concepto de "flujo", que simboliza **movimiento continuo, flexibilidad y cambio**. Queremos que trabajar con este framework sea como un flujo natural: intuitivo, sin fricciones y siempre en movimiento. Así como un río fluye hacia adelante superando obstáculos, **Flux** está diseñado para ayudar a los desarrolladores a superar los desafíos de desarrollo backend con elegancia y simplicidad. 🌊💡

> **"Codificar con Flux no es solo desarrollar, es fluir."**

## 🎯 Nuestra Filosofía

**Flux** se basa en tres principios fundamentales:

1. **Simplicidad**: Menos complejidad, más resultados. Queremos que puedas concentrarte en la lógica de tu negocio sin preocuparte por configuraciones complicadas.

2. **Escalabilidad**: Cada módulo, cada servicio, cada controlador está diseñado pensando en la escalabilidad. Comienza con un pequeño proyecto y expándelo sin problemas.

3. **Diversión y Comunidad**: Desarrollar debería ser divertido, y **Flux** se asegura de ello con una CLI interactiva, emojis, y opciones que hacen que tu experiencia sea como una aventura de desarrollo. Y como creemos en la comunidad, el código es abierto para recibir contribuciones y seguir mejorando juntos. 🤝

## 🚀 Características Principales

- **CLI Amigable**: Un asistente en la terminal que te acompaña paso a paso para crear nuevos proyectos, módulos, controladores, y servicios, todo de manera rápida y sin complicaciones.
- **Arquitectura Modular**: Cada parte de tu aplicación se divide en módulos para que el código sea mantenible, limpio y fácil de escalar.
- **Soporte para Bases de Datos**: Conexión rápida y sencilla con **PostgreSQL**, **MySQL**, y **SQLite** para que puedas almacenar tus datos de manera efectiva.
- **WebSockets y Middleware**: Capacidad para trabajar en **tiempo real** con **WebSockets** y agregar funcionalidades personalizadas con **middleware**.

## 💻 Instalación

Para comenzar a usar **Flux**, solo necesitas seguir unos simples pasos:

1. **Clona el repositorio** de GitHub:
   ```sh
   git clone <URL_DE_TU_REPOSITORIO>
   cd flux
Instala Flux globalmente:

sh
Copiar código
dart pub global activate --source path .
Ahora puedes usar Flux desde cualquier lugar de tu sistema:

sh
Copiar código
flux create project mi_proyecto
🎮 Comandos del CLI de Flux
Flux viene con una interfaz CLI amigable e interactiva que te ayudará a construir tu proyecto paso a paso. Aquí están los comandos más importantes:

1. Crear un Proyecto
sh
Copiar código
flux create project <nombre_del_proyecto>
Descripción: Inicia un nuevo proyecto con la estructura básica de Flux.
Interactividad: Se te pedirá que elijas una base de datos (🐘 PostgreSQL, 🐬 MySQL, 🗄️ SQLite o Sin base de datos).
2. Generar un Módulo
sh
Copiar código
flux generate m <nombre_del_modulo>
Alias: También puedes usar flux generate module o simplemente flux g m.
Descripción: Crea un nuevo módulo con su estructura correspondiente en lib/modules/.
Ejemplo:
sh
Copiar código
flux generate m usuario
Esto creará la estructura básica del módulo usuario.
3. Generar un Controlador
sh
Copiar código
flux generate c <nombre_del_modulo>
Alias: También puedes usar flux g c para abreviar.
Descripción: Añade un controlador al módulo especificado, donde definirás las rutas relacionadas.
Ejemplo:
sh
Copiar código
flux generate c usuario
Esto creará un archivo usuario_controller.dart dentro del módulo usuario.
4. Generar un Servicio
sh
Copiar código
flux generate s <nombre_del_modulo>
Alias: También puedes usar flux g s para abreviar.
Descripción: Crea un servicio dentro del módulo especificado para manejar la lógica de negocio.
Ejemplo:
sh
Copiar código
flux generate s usuario
Esto generará el archivo usuario_service.dart para manejar la lógica de negocio del módulo usuario.
📂 Estructura del Proyecto
Cuando creas un proyecto con Flux, obtendrás una estructura organizada y modular como esta:

bash
Copiar código
mi_proyecto/
├── bin/
│   └── flux.dart               # Archivo principal del CLI de Flux
├── lib/
│   ├── core/                  # Componentes centrales
│   │   ├── app.dart           # Punto de entrada principal de la app
│   │   ├── auth_service.dart  # Servicio de autenticación
│   │   └── middleware.dart    # Middlewares para autenticación y manejo de errores
│   ├── modules/               # Directorio de módulos
│   │   └── usuario/           # Ejemplo de módulo
│   │       ├── usuario_module.dart
│   │       ├── usuario_controller.dart
│   │       └── usuario_service.dart
└── test/
    └── flux_test.dart         # Archivo de pruebas
Esta estructura asegura que cada parte del código esté claramente organizada y sea fácil de encontrar, escalar y mantener.

🛠️ Configuración y Requerimientos
SDK de Dart: Asegúrate de tener instalado Dart SDK 3.5.4 o superior.
Variables de Entorno: Utiliza archivos .env para manejar configuraciones sensibles como claves secretas o credenciales de la base de datos.
Instalación de Dependencias: Luego de clonar el proyecto, ejecuta:
sh
Copiar código
dart pub get
💡 Contribuciones
Estamos construyendo Flux con la idea de que el desarrollo backend puede y debe ser divertido, colaborativo y desafiante. Todos los que quieran contribuir a mejorar la herramienta son bienvenidos. Desde sugerencias hasta creación de módulos adicionales, cualquier aporte suma para hacer que Flux sea la mejor herramienta posible. ¡No dudes en hacer un fork y enviar un pull request! 🤝

🥳 ¡Únete al Flujo!
Con Flux, construir aplicaciones backend no es solo escribir código, es fluir con el proceso. Nos enfocamos en mantenerte enfocado en lo que realmente importa: la lógica de tu negocio, mientras nosotros nos ocupamos de que el flujo de desarrollo sea tan natural como el agua de un río. 🌊✨

"Fluir con Flux: deja de luchar contra el código, y empieza a disfrutar del flujo de desarrollo."
