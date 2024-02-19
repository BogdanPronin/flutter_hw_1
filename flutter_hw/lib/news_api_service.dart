import 'package:dio/dio.dart';

class NewsApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = 'd3fc6b3d66b84cb898c1c5069d539ffa';

  Future<List<dynamic>> fetchTopHeadlines() async {
    try {
      final response = await _dio.get('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey');
      return response.data['articles'];
    } catch (error) {
      return [];
    }
  }
}
