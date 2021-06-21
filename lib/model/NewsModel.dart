// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

// to avoid error don't leave any field without checking the null condition for each object.

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

class Model {
  Model({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["status"] != null ? json["status"] : "Status",
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

//required makes every object compulsory

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] != null ? json["author"] : "Prakash Basent",
        title: json["title"] != null ? json["title"] : "Practise Title",
        description: json["description"] != null
            ? json["description"]
            : "Description of the news content",
        url: json["url"],
        urlToImage: json["urlToImage"] != null
            ? json["urlToImage"]
            : "https://cdn.pixabay.com/photo/2018/01/25/14/12/nature-3106213_1280.jpg",
        publishedAt:
            json["publishedAt"] != null ? json["publishedAt"] : "2020-12-02",
        content: json["content"] != null ? json["content"] : "Content",
      );
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] != null ? json["id"] : "Try one",
        name: json["name"] != null ? json["name"] : "Prakash Basnet",
      );
}
