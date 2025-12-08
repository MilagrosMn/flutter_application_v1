import 'package:flutter/material.dart';
import '../utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text("Menú", style: TextStyle(fontSize: 24)),
          ),
          ListTile(
            title: const Text("Inicio"),
            onTap: () => Navigator.pushNamed(context, Routes.home),
          ),
          ListTile(
            title: const Text("Listado"),
            onTap: () => Navigator.pushNamed(context, Routes.listado),
          ),
        ],
      ),
    );
  }
}
