
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:opinions/features/registration/repository/auth_repository.dart';

final authProvider = Provider<AuthRepository>((ref){
  return AuthRepository(client: http.Client());
});