import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_happening/data/repository/news_repository.dart';
import 'package:whats_happening/util/interceptor.dart';
import 'package:whats_happening/util/secret_config.dart';

class DependencyProvider extends StatefulWidget {
  const DependencyProvider({@required this.child});

  final Widget child;

  @override
  _DependencyProviderState createState() => _DependencyProviderState();
}

class _DependencyProviderState extends State<DependencyProvider> {
  final SecretConfigLoader _secretLoader = SecretConfigLoader();

  Dio _dio;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _setupDio();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? MultiRepositoryProvider(
            providers: [
              RepositoryProvider<NewsRepository>(
                create: (_) => NewsRepository(_dio),
                lazy: true,
              )
            ],
            child: widget.child,
          )
        : Center(child: CircularProgressIndicator());
  }

  void _setupDio() async {
    final config = await _secretLoader.load();
    _dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ))
      ..interceptors.addAll([
        ApiKeyInterceptor(apiKey: config.apiKey),
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          request: true,
        ),
      ]);

    setState(() {
      _isInitialized = true;
    });
  }
}
