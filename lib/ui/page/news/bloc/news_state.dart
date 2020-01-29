part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsInitialLoad extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadError extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  @override
  List<Object> get props => [];
}
