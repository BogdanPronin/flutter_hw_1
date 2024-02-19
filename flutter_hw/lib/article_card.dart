import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200.0,
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: const Text(
                    'No Image',
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
