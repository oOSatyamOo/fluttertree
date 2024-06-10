import '../../../../core/resources/data_state.dart';
import '../entities/artical_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticalEntity>>> getNewsArticles();
}
