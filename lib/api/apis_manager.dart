import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pulse_news/api/end_points.dart';
import 'package:pulse_news/api/model/news_response.dart';
import 'package:pulse_news/api/model/source_response.dart';
import 'package:pulse_news/core/utils/constants.dart';

class ApisManager {
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(EndPoints.baseurl, EndPoints.sources, {
      "apiKey": Constants.abiKey,
      "category": categoryId,
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

  Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(EndPoints.baseurl, EndPoints.newsApi, {
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
