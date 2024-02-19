import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.imageUrl ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(article.articleUrl);
                  await launchUrl(url);
                },
                child: const Text('Read full article'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
