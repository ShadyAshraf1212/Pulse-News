import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pulse_news/api/constants.dart';
import 'package:pulse_news/api/end_points.dart';
import 'package:pulse_news/model/news_response.dart';
import 'package:pulse_news/model/source_response.dart';

class ApisManager {
  static Future<SourceResponse?> getSources({ required String category }) async {
    Uri url = Uri.https(Constants.baseurl, EndPoints.sources, {
      "apiKey": Constants.abiKey,
      "category" : category,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(Constants.baseurl, EndPoints.newsApi, {
      "apiKey": Constants.abiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
