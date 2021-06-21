import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/model/exception.dart';
import 'package:chew_one/network/news_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  //newsRepo is the object of NewsRepo class, this object helps to communicate between
  //repositary and bloc
  NewsRepo newsRepo;
  NewsBloc({required this.newsRepo}) : super(NewsInitial());
  // NewsInitial is passed in the Bloc class as a initial state.
  //NewsInitial will be called at the initial state of the application
  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    yield NewsLoading();
    if (event is FetchNewsEvent) {
      print('loading');
      try {
        print('almost');
        List<Article> articles = await newsRepo.fetchNewOne();
        print(articles.length);
        print('finished');
        yield NewsLoaded(articles: articles);
      } on SocketException {
        yield NewsError(error: NoInternetException(message: 'No Internet'));
      } on HttpException {
        yield NewsError(error: NoServiceFoundException(message: 'No Service'));
      } on InvalidFormatException {
        yield NewsError(
          error: InvalidFormatException(message: 'Invalid format exception'),
        );
      } catch (e) {
        print(e);
        yield NewsError(error: UnknownException(message: 'Unknown Exception'));
      }
    }
  }
}

//Unhandled error FormatException: SyntaxError: Unexpected token < in JSON at position 0 occurred in Instance of
//Above error is handled by this code
//        await http.get(Uri.https("newsapi.org", "/v2/top-headlines", {
//   "country": "us",
//   "category": "business",
//   "apikey": "c10f036300b7460c99018f212f50188d"
// }));
