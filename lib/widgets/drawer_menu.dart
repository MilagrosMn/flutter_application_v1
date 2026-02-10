import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 162, 41, 218),
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),

          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listado'),
            onTap: () {
              Navigator.pushNamed(context, '/listado');
            },
          ),

          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Agregar película'),
            onTap: () {
              Navigator.pushNamed(context, '/form');
            }
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Acerca de'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),

          ListTile(
            title: const Text('Dark mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: Switch(
              value: themeProvider.isDarkmode,
              onChanged: (value) {themeProvider.toggleTheme();},
            )
          ),
        ],
      ),
    );
  }
}
