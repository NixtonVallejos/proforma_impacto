import 'package:flutter/material.dart';
import 'package:proforma_impacto/data/models/customer_model.dart';
import 'package:proforma_impacto/providers/customer_provider.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomer();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Clientes")),
      body: provider.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: provider.customer.length,
        itemBuilder: (context, index) {
          final Customer customer = provider.customer[index];
          return ListTile(
            title: Text(customer.name),
            subtitle: Text(customer.company ?? 'Sin empresa'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aquí más adelante podemos navegar a proformas con cliente seleccionado
            },
          );
        },
      ),
    );
  }
}
