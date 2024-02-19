import 'package:flutter/material.dart';

import 'article.dart';
import 'article_card.dart';
import 'article_detail_page.dart';
import 'news_api_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.system,
      home: const NewsHomePage(),
    );
  }
}

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  MainNewsHomePageState createState() {
    return MainNewsHomePageState();
  }
}

class MainNewsHomePageState extends State<NewsHomePage> {
  final NewsApiService _newsApiService = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsApiService.fetchTopHeadlines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return ArticleCard(
                  title: article['title'],
                  description: article['description'] ?? 'No description',
                  imageUrl: article['urlToImage'] ?? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.EcuKBG4J7zPXnW9GwqSOpAAAAA%26pid%3DApi&f=1&ipt=4ffac7a70ee25d16ec44bf31c730a8de7a6ce777d724f86f0a0f48a38bf98821&ipo=images',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ArticleDetailPage(
                        article: Article(
                          title: article['title'] ?? 'No title',
                          description: article['description'] ?? 'No article',
                          imageUrl: article['urlToImage'] ?? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.EcuKBG4J7zPXnW9GwqSOpAAAAA%26pid%3DApi&f=1&ipt=4ffac7a70ee25d16ec44bf31c730a8de7a6ce777d724f86f0a0f48a38bf98821&ipo=images',
                          articleUrl: article['url'] ?? 'No description',
                        ),
                      ),
                    ));
                  },
                );

              },
            );
          }
        },
      ),
    );
  }
}
