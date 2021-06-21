part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class FetchNewsEvent extends NewsEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
