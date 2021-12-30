import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newscast/app/app.logger.dart';
import 'package:newscast/app/config/locator.dart';
import 'package:newscast/services/api.dart';
import 'news_viewstate.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel extends StateNotifier<NewsViewState> {
  NewsViewModel() : super(NewsViewState());
  final log = getLogger('News ViewModel');
  final _network = locator<Api>();

  void initialize() async {
    await getNews();
  }

  Future<void> getNews() async {
    state = state.copyWith(isLoading: true);
    try {
      final news = await _network.getArticles();
      state = state.copyWith(articles: news, isLoading: false);
      log.i(news);
    } catch (e) {
      log.e(e.toString());
    }
  }

  void launchUrl(urlString) async {
    try {
      await launch(urlString);
    } catch (e) {
      rethrow;
    }
  }
}
