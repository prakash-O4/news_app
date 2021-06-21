import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/network/news_data.dart';

class NewsRepo {
  FetchNews fetchNews = FetchNews();
  Future<List<Article>> fetchNewOne() => fetchNews.fetchNews();
}
