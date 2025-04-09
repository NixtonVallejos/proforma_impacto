import 'package:flutter/material.dart';
import 'package:proforma_impacto/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'data/repositories/api_service.dart';
import 'providers/auth_provider.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(ApiService())),
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
      initialRoute: 'home',
      routes: {
        '/':          (_) => const LoginScreen(),
        '/home':      (_) => const HomeScreen(),
        '/customers': (_) => const Scaffold(body: Center(child: Text("Pantalla Clientes"))),
        '/inventory': (_) => const Scaffold(body: Center(child: Text("Pantalla Inventario"))),
        '/stimates':  (_) => const Scaffold(body: Center(child: Text("Pantalla Proformas"))),
        '/reports':   (_) => const Scaffold(body: Center(child: Text("Pantalla Reportes"))),
      },
    );
  }
}
