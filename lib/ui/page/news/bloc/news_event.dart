part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  const LoadNewsEvent();
}

class RefreshNewsEvent extends NewsEvent {
  const RefreshNewsEvent();
}
