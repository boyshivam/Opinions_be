

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorgeService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const tokenKey = "access_token";


  // save a token
  Future<void> saveToken(String token) async {
    await storage.write(key: tokenKey , value: token);
  }

  // fetch token
  Future<String?> fetchToken() async {
    final token = await storage.read(key: tokenKey);
    return token;
  }

  // delete token
  Future<void> deleteToken() async {
    await storage.delete(key: tokenKey);
  }




}