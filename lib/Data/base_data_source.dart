import '/Data/Models/category_model.dart';
import 'Models/recipe_model.dart';

abstract class BaseDataSource {
  Future<List<CategoryModel>> fetchCategories();

  Future<RecipeModel> fetchRecipe();
}
