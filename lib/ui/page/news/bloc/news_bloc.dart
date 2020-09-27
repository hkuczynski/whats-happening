import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:whats_happening/data/model/news.dart';
import 'package:whats_happening/data/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({@required NewsRepository newsRepository})
      : assert(newsRepository != null),
        _newsRepository = newsRepository,
        super(NewsInitialState());

  final NewsRepository _newsRepository;

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNewsEvent) {
      yield* _mapLoadNewsEvent();
    } else if (event is RefreshNewsEvent && state is NewsLoadedState) {
      yield* _mapRefreshNewsEvent(state);
    }
  }

  Stream<NewsState> _mapLoadNewsEvent() async* {
    yield NewsInitialLoadState();
    try {
      final news = await _newsRepository.fetchNews();
      yield NewsLoadedState(items: news);
    } catch (exception) {
      yield NewsLoadErrorState();
    }
  }

  Stream<NewsState> _mapRefreshNewsEvent(NewsLoadedState state) async* {
    yield state.copyWith(isRefreshing: true);

    try {
      final news = await _newsRepository.fetchNews();
      yield state.copyWith(items: news, isRefreshing: false);
    } catch (exception) {
      yield state;
    }
  }
}
