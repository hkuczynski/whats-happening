import 'package:dio/dio.dart';

import 'package:whats_happening/data/model/news.dart';

class NewsRepository {
  NewsRepository(Dio dio)
      : assert(dio != null),
        _dio = dio;

  final Dio _dio;

  Future<List<News>> fetchNews() async {
    final response = await _dio.get(
      "top-headlines",
      queryParameters: {
        "country": "us",
        "category": "business",
      },
    );
    final news = (response.data["articles"] as List<dynamic>)?.map((jsonEntry) => News.fromJson(jsonEntry));
    return news.toList();
  }
}
