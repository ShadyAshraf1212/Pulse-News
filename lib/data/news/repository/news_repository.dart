import '../../../api/model/news_response.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNews(String sourceId);
}
