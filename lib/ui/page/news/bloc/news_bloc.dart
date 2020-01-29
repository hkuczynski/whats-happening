import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_happening/data/mock/news.dart';
import 'package:whats_happening/data/model/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  @override
  NewsState get initialState => NewsInitialState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNewsEvent) {
      yield NewsInitialLoadState();
      await Future.delayed(Duration(seconds: 2));
      yield NewsLoadedState(items: [
        newsMock1,
        newsMock1,
        newsMock1,
        newsMock1,
      ]);
    }
  }
}
