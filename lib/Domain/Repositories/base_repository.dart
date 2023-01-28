import '/Domain/Entities/category.dart';
import '/Domain/Entities/recipe_summary.dart';

import '../Entities/recipe.dart';
import '../Entities/user.dart';

abstract class BaseRepository {
  //TODO: implement parameters
  ///Fetches [Recipe] data by given parameters
  Future<Recipe> fetchRecipe(String recipeId);

  ///Fetches recipes summaries for given [Category].
  Future<List<RecipeSummary>> fetchRecipesByCategory(Category category);

  ///Fetches all categories.
  Future<List<Category>> fetchCategories();

  ///Fetches bookmarks of given [User].
  Future<List<RecipeSummary>> fetchBookmarks(User user);
}
