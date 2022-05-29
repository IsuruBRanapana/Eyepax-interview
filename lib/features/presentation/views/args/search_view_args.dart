import '../../../domain/entities/response/news_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 14:42

class SearchViewArgs{
  final NewsResponse news;
  final String searchedText;

  SearchViewArgs({required this.news, required this.searchedText});
}