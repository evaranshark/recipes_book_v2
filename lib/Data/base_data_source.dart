import '/Data/Models/category_model.dart';
import 'Models/recipe_model.dart';
import 'Models/recipe_summary_model.dart';

abstract class BaseDataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<RecipeSummaryModel>> fetchRecipesByCategory(
      BaseDataSourceParams params);

  Future<RecipeModel> fetchRecipe(BaseDataSourceParams params);
}

class BaseDataSourceParams {
  final String? categoryId;
  final String? recipeId;
  const BaseDataSourceParams({this.categoryId, this.recipeId});
}
