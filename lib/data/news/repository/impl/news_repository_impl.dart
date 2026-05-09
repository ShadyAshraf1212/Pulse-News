import 'package:pulse_news/data/news/data_source/remote/news_remote_ds.dart';
import 'package:pulse_news/data/news/repository/news_repository.dart';

import '../../../../api/model/news_response.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDS newsRemoteDS;
  NewsRepositoryImpl({required this.newsRemoteDS});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return newsRemoteDS.getNews(sourceId);
  }
}
