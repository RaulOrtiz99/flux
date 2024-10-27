import 'package:postgres/postgres.dart';

class Database {
  final PostgreSQLConnection _connection = PostgreSQLConnection(
    'localhost', // Dirección del servidor
    5432, // Puerto por defecto
    'nombre_bd', // Nombre de la base de datos
    username: 'usuario', // Usuario de la base de datos
    password: 'contraseña', // Contraseña
  );

  Future<void> connect() async {
    await _connection.open();
    print('Conexión a la base de datos exitosa.');
  }

  PostgreSQLConnection get connection => _connection;
}
