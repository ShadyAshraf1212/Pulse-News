import '../../../../api/model/news_response.dart';

abstract class NewsRemoteDS {
  Future<NewsResponse?> getNews(String sourceId);
}
