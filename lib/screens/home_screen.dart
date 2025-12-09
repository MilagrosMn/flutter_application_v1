import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import '../utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(title: const Text("Inicio")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, Routes.listado),
          child: const Text("Ir al listado"),
        ),
      ),
    );
  }
}
