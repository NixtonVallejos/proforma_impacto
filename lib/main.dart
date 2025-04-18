import 'package:flutter/material.dart';
import 'package:proforma_impacto/presentation/screens/customers_screen.dart';
import 'package:proforma_impacto/presentation/screens/home_screen.dart';
import 'package:proforma_impacto/providers/customer_provider.dart';
import 'package:provider/provider.dart';
import 'data/repositories/api_service.dart';
import 'providers/auth_provider.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(ApiService())),
        ChangeNotifierProxyProvider<AuthProvider, CustomerProvider>(
          create: (context) => CustomerProvider(
            apiService: ApiService(),
            authProvider: context.read<AuthProvider>(),
          ),
          update: (context, authProvider, previous) => CustomerProvider(apiService: ApiService(), authProvider: authProvider),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proformas App',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':          (_) => LoginScreen(),
        '/home':      (_) => HomeScreen(),
        '/customers': (_) => CustomerScreen(),
        '/inventory': (_) => const Scaffold(body: Center(child: Text("Pantalla Inventario"))),
        '/stimates':  (_) => const Scaffold(body: Center(child: Text("Pantalla Proformas"))),
        '/reports':   (_) => const Scaffold(body: Center(child: Text("Pantalla Reportes"))),
      },
    );
  }
}
