import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../news_navigator.dart';
import 'bloc/news_bloc.dart';
import 'widget/news_item.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What's happening"),
        centerTitle: false,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        newsRepository: RepositoryProvider.of(context),
      )..add(LoadNewsEvent()),
      child: NewsList(),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      listenWhen: (newState, oldState) =>
          oldState is NewsLoadedState && oldState.isRefreshing && newState is NewsLoadedState && !newState.isRefreshing,
      listener: (context, state) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      },
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadedState) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.separated(
              itemBuilder: (context, index) => _buildItem(context, index, state),
              separatorBuilder: _buildSeparator,
              itemCount: state.items.length,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
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
      onPressed: () {
        Navigator.of(context).pushNamed(NewsNavigatorRoutes.newsDetails);
      },
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return Container(height: 12);
  }

  Future<void> _onRefresh() {
    BlocProvider.of<NewsBloc>(context).add(RefreshNewsEvent());
    return _refreshCompleter.future;
  }
}
