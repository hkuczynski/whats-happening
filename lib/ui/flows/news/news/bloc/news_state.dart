part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsInitialLoadState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadErrorState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  const NewsLoadedState({
    this.items = const [],
    this.isRefreshing = false,
  });

  final List<News> items;
  final bool isRefreshing;

  @override
  List<Object> get props => [items, isRefreshing];

  NewsLoadedState copyWith({
    List<News> items,
    bool isRefreshing,
  }) {
    return NewsLoadedState(
      items: items ?? this.items,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
