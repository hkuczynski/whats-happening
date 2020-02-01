import 'package:dio/dio.dart';

import 'package:whats_happening/data/mock/news.dart';
import 'package:whats_happening/data/model/news.dart';

class NewsRepository {
  NewsRepository(Dio dio)
      : assert(dio != null),
        _dio = dio;

  final Dio _dio;

  Future<List<News>> fetchNews() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      newsMock1,
      newsMock1,
      newsMock1,
      newsMock1,
    ];
  }
}
