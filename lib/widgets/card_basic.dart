import 'package:flutter/material.dart';

class CardBasic extends StatelessWidget {
  final String title;
  final int year;
  final String director;
  final String? imageUrl;
  final String genre;
  final double rating;
  final bool favorite;
  final VoidCallback? onTap;

  const CardBasic({
    super.key,
    required this.title,
    required this.year,
    required this.director,
    this.imageUrl,
    required this.genre,
    required this.rating,
    required this.favorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        leading: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.asset(imageUrl!, width: 50, fit: BoxFit.cover)
            : const Icon(Icons.movie, size: 40),
        title: Text("$title ($year)"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(director),
          const SizedBox(height: 4),
          Text(genre),
          Text("rating: $rating")
          ],
        ),
      ),
    );
  }
}
