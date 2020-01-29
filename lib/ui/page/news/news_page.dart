import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_happening/ui/page/news/widget/news_item.dart';

import './bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What's happening")),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(LoadNewsEvent()),
      child: NewsList(),
    );
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadedState) {
          return ListView.separated(
            itemBuilder: (context, index) => _buildItem(context, index, state),
            separatorBuilder: _buildSeparator,
            itemCount: state.items.length,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildItem(BuildContext context, int index, NewsLoadedState state) {
    final news = state.items[index];
    return NewsItem(
      title: news.title,
      description: news.description,
      imageUrl: news.imageUrl,
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return Container(height: 12);
  }
}
