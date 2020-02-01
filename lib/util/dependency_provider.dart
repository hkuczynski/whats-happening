import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_happening/data/repository/news_repository.dart';

class DependencyProvider extends StatefulWidget {
  const DependencyProvider({@required this.child});

  final Widget child;

  @override
  _DependencyProviderState createState() => _DependencyProviderState();
}

class _DependencyProviderState extends State<DependencyProvider> {
  Dio _dio;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
      baseUrl: "",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ))
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        request: true,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NewsRepository>(
          create: (_) => NewsRepository(_dio),
          lazy: true,
        )
      ],
      child: widget.child,
    );
  }
}
