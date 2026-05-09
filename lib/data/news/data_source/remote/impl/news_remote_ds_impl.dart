import 'package:pulse_news/api/dio_manager.dart';
import 'package:pulse_news/data/news/data_source/remote/news_remote_ds.dart';

import '../../../../../api/model/news_response.dart';

class NewsRemoteDSImpl implements NewsRemoteDS {
  DioManager dioManager;
  NewsRemoteDSImpl({required this.dioManager});
  @override
  Future<NewsResponse?> getNews(String sourceId) async {
    var response = await dioManager.getNews(sourceId);
    return response;
  }
}