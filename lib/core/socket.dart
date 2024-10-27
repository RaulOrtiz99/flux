import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

void handleWebSocketConnection(webSocket) {
  // Se maneja la recepción de mensajes del cliente
  webSocket.listen(
    (message) {
      print('Mensaje recibido: $message');
      
      // Responder al cliente
      final response = jsonEncode({'respuesta': 'Mensaje recibido correctamente'});
      webSocket.add(response);
    },
    onError: (error) {
      print('Error en WebSocket: $error');
    },
    onDone: () {
      print('WebSocket cerrado');
    },
    cancelOnError: true,
  );
}

// Crea un manejador de WebSocket usando shelf_web_socket
Handler createWebSocketHandler() {
  return webSocketHandler(handleWebSocketConnection);
}
