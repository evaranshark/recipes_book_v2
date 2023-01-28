import 'package:recipes_book_v2/Domain/Repositories/base_repository.dart';
import 'package:recipes_book_v2/Utils/use_case.dart';

import '../Entities/category.dart';
import '../Entities/recipe_summary.dart';

class FetchCategoryRecipes
    implements UseCase<List<RecipeSummary>, FetchRecipeParams> {
  final BaseRepository repository;
  const FetchCategoryRecipes(this.repository);

  @override
  Future<List<RecipeSummary>> execute(FetchRecipeParams params) {
    return repository.fetchRecipesByCategory(params.category);
  }
}

class FetchRecipeParams {
  final Category category;

  FetchRecipeParams(this.category);
}
