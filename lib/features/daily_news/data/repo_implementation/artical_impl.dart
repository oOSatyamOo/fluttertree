import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/artical_model.dart';

class ArticleImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleImpl({required NewsApiService newsApiService})
      : _newsApiService = newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final HttpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (HttpResponse.response.statusCode == HttpStatus.ok) {
        HttpResponse.data.removeWhere(
          (element) => element.urlToImage == null,
        );
        return DataSuccess(HttpResponse.data);
      } else {
        return DataFailed(DioException(
            error: HttpResponse.response.statusMessage,
            response: HttpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: HttpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
