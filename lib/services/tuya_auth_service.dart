import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class TuyaAuthService {
  final String clientId = "3cf8w8knj9amv3rktavh";
  final String clientSecret = "1c2b1662cb5e46dd9f7bd33e25c55c0c";
  final String regionUrl = "https://openapi.tuyain.com"; // ✅ Fixed

  Future<String?> getAccessToken() async {
    final dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };

    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final signStr = clientId + timestamp;

    final hmac = Hmac(sha256, utf8.encode(clientSecret));
    final digest = hmac
        .convert(utf8.encode(signStr))
        .toString()
        .toUpperCase(); // ✅ Capitalized

    try {
      final response = await dio.post(
        "$regionUrl/v1.0/token",
        queryParameters: {"grant_type": "1"},
        options: Options(
          headers: {
            "client_id": clientId,
            "sign": digest,
            "t": timestamp,
            "sign_method": "HMAC-SHA256",
          },
        ),
      );

      print("🔎 Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        final token = response.data['result']['access_token'];
        print("✅ Tuya Access Token: $token");
        return token;
      } else {
        print("❌ Unexpected Response: ${response.data}");
        return null;
      }
    } catch (e) {
      print("❌ Dio Exception: $e");
      return null;
    }
  }
}
