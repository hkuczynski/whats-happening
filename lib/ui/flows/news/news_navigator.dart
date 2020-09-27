import 'package:flutter/material.dart';

import 'package:whats_happening/util/page_route.dart';
import 'news/news_page.dart';
import 'news_details/news_details_page.dart';

class NewsNavigatorRoutes {
  static const String news = 'news';
  static const String newsDetails = 'news_details';
}

class NewsNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: NewsNavigatorRoutes.news,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case NewsNavigatorRoutes.news:
            return AppPageRoutes.adaptiveRoute(builder: (_) => NewsPage());
          case NewsNavigatorRoutes.newsDetails:
            return AppPageRoutes.adaptiveRoute(builder: (_) => NewsDetailsPage());
          default:
            throw FallThroughError();
        }
      },
    );
  }
}
