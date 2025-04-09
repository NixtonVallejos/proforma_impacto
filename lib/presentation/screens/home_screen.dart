import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_HomeOption> options = [
      _HomeOption("Clientes", Icons.people, "/clientes"),
      _HomeOption("Inventario", Icons.inventory, "/inventario"),
      _HomeOption("Proformas", Icons.description, "/proformas"),
      _HomeOption("Reportes", Icons.bar_chart, "/reportes"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Menú Principal"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children:
            options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, option.route);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(option.icon, size: 48),
                    const SizedBox(height: 12),
                    Text(option.title, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}

class _HomeOption {
  final String title;
  final IconData icon;
  final String route;

  _HomeOption(this.title, this.icon, this.route);
}
