import 'package:dio/dio.dart';
import 'package:newscast/app/app.logger.dart';
import 'package:newscast/app/models/models.dart';
import 'package:newscast/utils/constants.dart';

class Api {
  final log = getLogger('API');
  final _dio = Dio();

  Future<List<Articles>?> getArticles() async {
    log.i('Making request to $baseUrl');
    try {
      final response = await _dio.get('$baseUrl$apiKey');
      if (response.statusCode == 200) {
        List articles = response.data["articles"];
        final data = articles.map((json) => Articles.fromJson(json)).toList();
        return data;
      } else {
        throw Failure(message: 'Unauthorized request');
      }
    } on DioError catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}

class Failure {
  final String? message;
  Failure({this.message});
}
