// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

// part 'news_model.g.dart';

// News newsFromJson(String str) => News.fromJson(json.decode(str));

// String newsToJson(News data) => json.encode(data.toJson());

// @JsonSerializable()
// class News {
//   @JsonKey(name: "status")
//   String status;
//   @JsonKey(name: "totalResults")
//   int totalResults;
//   @JsonKey(name: "articles")
//   List<Article> articles;

//   News({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

//   Map<String, dynamic> toJson() => _$NewsToJson(this);
// }

// @JsonSerializable()
// class Article {
//   @JsonKey(name: "source")
//   Source source;
//   @JsonKey(name: "author")
//   String author;
//   @JsonKey(name: "title")
//   String title;
//   @JsonKey(name: "description")
//   String description;
//   @JsonKey(name: "url")
//   String url;
//   @JsonKey(name: "urlToImage")
//   String urlToImage;
//   @JsonKey(name: "publishedAt")
//   DateTime publishedAt;
//   @JsonKey(name: "content")
//   String content;

//   Article({
//     required this.source,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) =>
//       _$ArticleFromJson(json);

//   Map<String, dynamic> toJson() => _$ArticleToJson(this);
// }

// @JsonSerializable()
// class Source {
//   @JsonKey(name: "id")
//   dynamic id;
//   @JsonKey(name: "name")
//   String name;

//   Source({
//     required this.id,
//     required this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

//   Map<String, dynamic> toJson() => _$SourceToJson(this);
// }

// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'news_model.g.dart';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

@JsonSerializable()
class News {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "articles")
  List<Article>? articles;

  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Article {
  @JsonKey(name: "source")
  Source? source;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  DateTime? publishedAt;
  @JsonKey(name: "content")
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  dynamic id;
  @JsonKey(name: "name")
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
