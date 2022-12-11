import 'package:recipes_book_v2/Domain/Repositories/base_repository.dart';

import '../../Utils/use_case.dart';
import '../Entities/category.dart';

class FetchCategories
    implements UseCase<List<Category>, FetchCategoriesParams> {
  final BaseRepository repository;
  const FetchCategories(this.repository);

  @override
  Future<List<Category>> execute(FetchCategoriesParams params) {
    return repository.fetchCategories();
  }
}

class FetchCategoriesParams {}
