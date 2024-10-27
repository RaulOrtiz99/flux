import 'dart:convert';
import 'package:crypto/crypto.dart'; // Necesario para usar HMAC-SHA256

class AuthService {
  // Clave secreta para firmar los tokens. Esta debería almacenarse de forma segura, por ejemplo, usando variables de entorno.
  final String _secretKey;

  // Constructor que toma la clave secreta como parámetro para mayor flexibilidad.
  AuthService(this._secretKey);

  // Método para generar un token para un usuario
  String generateToken(String userId, String role) {
    // Crea la carga útil del token
    final payload = jsonEncode({
      'userId': userId,
      'role': role,
      'iat': DateTime.now().millisecondsSinceEpoch, // Fecha de emisión
    });

    // Codifica la carga útil en Base64
    final base64Payload = base64Url.encode(utf8.encode(payload));

    // Firma la carga útil con la clave secreta usando HMAC-SHA256
    final hmac = Hmac(sha256, utf8.encode(_secretKey)); // HMAC con la clave secreta
    final signature = base64Url.encode(hmac.convert(utf8.encode(base64Payload)).bytes);

    // El token es la combinación de la carga útil codificada y la firma
    return '$base64Payload.$signature';
  }

  // Método para verificar un token
  bool verifyToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) {
        return false; // El token debe tener dos partes: payload y firma
      }

      final base64Payload = parts[0];
      final signature = parts[1];

      // Verifica la firma del token
      final hmac = Hmac(sha256, utf8.encode(_secretKey));
      final expectedSignature = base64Url.encode(hmac.convert(utf8.encode(base64Payload)).bytes);

      return signature == expectedSignature;
    } catch (e) {
      print('Error al verificar el token: $e');
      return false;
    }
  }

  // Método para obtener los datos del token decodificado
  Map<String, dynamic>? getDecodedToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) {
        return null;
      }

      final base64Payload = parts[0];
      final payload = utf8.decode(base64Url.decode(base64Payload));

      return jsonDecode(payload) as Map<String, dynamic>;
    } catch (e) {
      print('Error al decodificar el token: $e');
      return null;
    }
  }
}
