import 'package:chew_one/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class FetchNews {
  // static String country = "us";
  // static String category = "business";
  // static String key = "c10f036300b7460c99018f212f50188d";
  // String url =
  //     "newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c10f036300b7460c99018f212f50188d";
  Future<List<Article>> fetchNews() async {
    var fetchedData =
        await http.get(Uri.https("newsapi.org", "/v2/top-headlines", {
      "country": "us",
      "category": "business",
      "apikey": "c10f036300b7460c99018f212f50188d"
    }));
    print("incoming");
    if (fetchedData.statusCode == 200) {
      // print('data fetched');
      Model newsData = modelFromJson(fetchedData.body);
      List<Article> model = newsData.articles;
      return model;
    } else {
      print(fetchedData.statusCode);
      throw Exception();
    }
  }
}
