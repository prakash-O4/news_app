part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class NewsLoaded extends NewsState {
  final List<Article> articles;
  NewsLoaded({required this.articles});
  @override
  List<Object> get props => throw UnimplementedError();
}

class NewsError extends NewsState {
  final error;
  NewsError({this.error});
  @override
  List<Object> get props => throw UnimplementedError();
}
