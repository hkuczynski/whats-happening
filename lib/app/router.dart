import 'package:flutter/material.dart';
import 'package:whats_happening/ui/page/news/news_page.dart';
import 'package:whats_happening/util/page_route.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return AppPageRoutes.fadeRoute(builder: (_) => NewsPage());
      default:
        return null;
    }
  }
}
