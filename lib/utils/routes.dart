import 'package:flutter/material.dart';
import '../screens/screens.dart';

class Routes {
  static const home = '/';
  static const listado = '/listado';
  static const detalle = '/detalle';
}

final Map<String, WidgetBuilder> appRoutes = {
  Routes.home: (_) => const HomeScreen(),
  Routes.listado: (_) => const ListadoScreen(),
  Routes.detalle: (_) => const DetalleScreen(),
};
