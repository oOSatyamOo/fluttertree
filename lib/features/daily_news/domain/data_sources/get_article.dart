import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/artical_entity.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticalEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;

  @override
  Future<DataState<List<ArticalEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
