import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({super.key});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  final ApiService api = ApiService();
  Movie? movie;
  bool activo = true;
  bool loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = ModalRoute.of(context)!.settings.arguments as int;
    load(id);
  }

  Future<void> load(int id) async {
    movie = await api.fetchDetalle(id);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(movie!.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (movie!.imagen.isNotEmpty)
              Image.network(movie!.imagen, height: 200),

            TextFormField(
              initialValue: movie!.director,
              decoration: const InputDecoration(label: Text("Descripción")),
            ),

            SwitchListTile(
              title: const Text("Activo"),
              value: activo,
              onChanged: (v) => setState(() => activo = v),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cambios guardados (mock)")),
              ),
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
