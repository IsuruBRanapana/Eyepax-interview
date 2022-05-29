import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 10:37

class NewsResponse extends Equatable {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  @override
  List<Object> get props => [status, totalResults, articles];
}

class Article extends Equatable {
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

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  @override
  List<Object> get props => [
        source!,
        author!,
        title!,
        description!,
        url!,
        urlToImage!,
        publishedAt!,
        content!
      ];
}

class Source extends Equatable {
  Source({
    this.id,
    this.name,
  });

  dynamic id;
  String? name;

  @override
  List<Object> get props => [id, name!];
}
