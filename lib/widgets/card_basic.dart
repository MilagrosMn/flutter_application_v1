import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/default_theme.dart';
class CardBasic extends StatelessWidget {
  final String title;
  final int year;
  final String director;
  final String? imageUrl;
  final String genre;
  final bool favorite;
  final VoidCallback? onTap;

  const CardBasic({
    super.key,
    required this.title,
    required this.year,
    required this.director,
    this.imageUrl,
    required this.genre,
    required this.favorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: Row(
          children: [
            imageUrl != null && imageUrl!.isNotEmpty
              ? Image.network(imageUrl!, width: 50, fit: BoxFit.cover)
              : const Icon(Icons.movie, size: 40),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$title ($year)", style: const TextStyle(fontSize: 18, color: DefaultTheme.primaryDark, fontWeight: FontWeight.w900)),
                  Text(director),
                  const SizedBox(height: 4),
                  Text(genre),
                ],
             )
            ),
            Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              color: favorite ? DefaultTheme.primaryDark : Colors.grey
            )
         ]
        )
      )
    );
  }
}