import 'package:flutter/material.dart';
import 'package:proforma_impacto/data/models/customer_model.dart';
import '../data/repositories/api_service.dart';
import 'auth_provider.dart';

class CustomerProvider with ChangeNotifier {
  final ApiService apiService;
  final AuthProvider authProvider;

  List<Customer> _customer = [];
  bool _isLoading = false;

  CustomerProvider({required this.apiService, required this.authProvider});

  List<Customer> get customer => _customer;
  bool get isLoading => _isLoading;

  Future<void> fetchCustomer() async {
    _isLoading = true;
    // notifyListeners();

    try {
      final token = authProvider.token;
      if (token == null) throw Exception("Token no disponible");

      final response = await apiService.get("/customers", token);
      print("Response: $response");
      final List<dynamic> customerData = response[1]['data'];
      _customer = customerData.map((e) => Customer.fromJson(e)).toList();
    } catch (e) {
      debugPrint("Error al cargar clientes: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
