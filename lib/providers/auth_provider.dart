import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/models/user_model.dart';
import '../data/repositories/api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService apiService;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _token;
  User? _user;

  AuthProvider(this.apiService);

  String? get token => _token;
  User? get user => _user;
  bool get isLoggedIn => _token != null;

  Future<bool> login(String username, String password) async {
    try {
      final response = await apiService.login(username, password);
      if (response != null) {
        _token = response;
        await _storage.write(key: 'token', value: _token);
        // Aquí deberías llamar a un endpoint que devuelva info del usuario si es necesario
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint("Login error: $e");
    }
    return false;
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    await _storage.deleteAll();
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'token');
    notifyListeners();
  }
}
