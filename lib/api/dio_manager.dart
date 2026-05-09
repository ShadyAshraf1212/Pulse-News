import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pulse_news/api/app_exception.dart';
import 'package:pulse_news/api/end_points.dart';
import 'package:pulse_news/api/model/news_response.dart';

import '../core/utils/constants.dart';
import 'model/source_response.dart';

class DioManager {
  final dio = Dio(BaseOptions(baseUrl: EndPoints.baseurl));
  DioManager() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
      ),
    );
    dio.interceptors.add(DioInterceptors());
  }
  Future<SourceResponse?> getSources(String? categoryId) async {
    try {
      var response = await dio.get(
        EndPoints.sources,
        queryParameters: {"category": categoryId},
      );
      return SourceResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse?> getNews(String? sourceId) async {
    try {
      var response = await dio.get(
        EndPoints.newsApi,
        queryParameters: {"sources": sourceId},
      );
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Key": Constants.abiKey});
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = "Something went wrong";
    try {
      if (err.response != null &&
          err.response!.data is Map &&
          err.response!.data.containsKey("message")) {
        errorMessage = err.response!.data["message"];
      } else {
        switch (err.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.connectionError:
            errorMessage =
                "Connection Time Out . Please Check Your Internet Connection";
            break;
          case DioExceptionType.badResponse:
            errorMessage =
                "Failed To Load Data . Status Code : ${err.response!.statusCode}";
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request To Api Was Cancelled";
            break;
          case DioExceptionType.unknown:
            errorMessage = "An Unknown Network Error Occurred";
            break;
          default:
            errorMessage = "An Unknown Error Occurred";
            break;
        }
      }
    } catch (e) {
      errorMessage = "An UnExpected Error Occurred ${e.toString()}";
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: AppException(errorMessage: errorMessage),
        message: errorMessage,
        response: err.response,
        type: err.type,
      ),
    );
  }
}
