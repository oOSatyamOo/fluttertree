import 'package:fluttertree/features/daily_news/domain/repository/article_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repo_implementation/artical_impl.dart';
import 'features/daily_news/domain/data_sources/get_article.dart';
import 'features/daily_news/persentation/bloc/article/remote/remote_article_bloc.dart';

final s1 = GetIt.instance;
Future<void> initializeDependencies() async {
  //Dio
  s1.registerSingleton<Dio>(Dio());

  //Dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));

// Repo can not be instance contract rather implementation
  s1.registerSingleton<ArticleRepository>(ArticleImpl(newsApiService: s1()));

  //usecases
  s1.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(articleRepository: s1()));

  s1.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(s1()));
}
