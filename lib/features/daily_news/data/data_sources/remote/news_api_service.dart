import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/resources/constants.dart';
import '../../models/artical_model.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') required String apiKey,
    @Query('country') required String country,
    @Query('category') required String category,
  });
}
