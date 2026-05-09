//todo: sourceRepo   => object SourceRepositoryImpl
//todo: SourceRepositoryImpl   => object SourceRemoteDSImpl
//todo: SourceRemoteDSImpl   => object ApiManager

import 'package:pulse_news/api/dio_manager.dart';
import 'package:pulse_news/data/news/data_source/remote/impl/news_remote_ds_impl.dart';
import 'package:pulse_news/data/news/repository/news_repository.dart';
import 'package:pulse_news/data/source/data_source/remote/impl/source_remote_ds_impl.dart';
import 'package:pulse_news/data/source/data_source/remote/source_remote_ds.dart';
import 'package:pulse_news/data/source/repository/impl/source_repository_impl.dart';
import 'package:pulse_news/data/source/repository/source_repository.dart';

import '../data/news/data_source/remote/news_remote_ds.dart';
import '../data/news/repository/impl/news_repository_impl.dart';

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(sourceRemoteDS: injectSourceRemoteDS());
}

SourceRemoteDS injectSourceRemoteDS() {
  return SourceRemoteDSImpl(dioManager: injectApiManager());
}

DioManager injectApiManager() {
  return DioManager();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(newsRemoteDS: injectNewsRemoteDS());
}

NewsRemoteDS injectNewsRemoteDS() {
  return NewsRemoteDSImpl(dioManager: DioManager());
}
