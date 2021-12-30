import 'package:newscast/app/models/models.dart';

class NewsViewState {
  final List<Articles>? articles;
  final bool isLoading;
  NewsViewState({this.articles, this.isLoading = false});

  NewsViewState copyWith({List<Articles>? articles, bool? isLoading}) {
    return NewsViewState(
        articles: articles ?? this.articles,
        isLoading: isLoading ?? this.isLoading);
  }
}
