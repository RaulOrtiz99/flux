import 'package:mysql1/mysql1.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:postgres/postgres.dart';

enum DatabaseType { postgres, mysql, sqlite }

class DatabaseConnection {
  late final dynamic connection;

  DatabaseConnection(DatabaseType type, {required String host, required int port, required String database, String? username, String? password}) {
    switch (type) {
      case DatabaseType.postgres:
        connection = PostgreSQLConnection(host, port, database, username: username, password: password);
        break;
      case DatabaseType.mysql:
        connection = MySqlConnection.connect(ConnectionSettings(
          host: host,
          port: port,
          user: username,
          db: database,
          password: password,
        ));
        break;
      case DatabaseType.sqlite:
        connection = sqlite3.open(database);
        break;
    }
  }

  Future<void> connect() async {
    if (connection is PostgreSQLConnection) {
      await connection.open();
    } else if (connection is MySqlConnection) {
      // MySQL connection already opens on connect.
    }
  }

  void close() {
    if (connection is PostgreSQLConnection || connection is MySqlConnection) {
      connection.close();
    } else if (connection is Database) {
      connection.dispose();
    }
  }
}
