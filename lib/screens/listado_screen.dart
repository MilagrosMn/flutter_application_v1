import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/card_basic.dart';
import '../utils/routes.dart';

class ListadoScreen extends StatefulWidget {
  const ListadoScreen({super.key});

  @override
  State<ListadoScreen> createState() => _ListadoScreenState();
}

class _ListadoScreenState extends State<ListadoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Listado de Películas")),
      drawer: const Drawer(),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
              ? Center(child: Text(provider.error!))
              : ListView.builder(
                  itemCount: provider.movies.length,
                  itemBuilder: (_, i) {
                    final m = provider.movies[i];
                    return CardBasic(
                      title: m.titulo,
                      year: m.year,
                      director: m.director,
                      imageUrl: m.imagen,
                      genre: m.genre,
                      rating: m.rating,
                      favorite: m.favorite,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.detalle,
                        arguments: m.id,
                      ),
                    );
                  },
                ),
    );
  }
}
