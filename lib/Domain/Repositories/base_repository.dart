import '/Domain/Entities/category.dart';
import '/Domain/Entities/recipe_summary.dart';

import '../Entities/recipe.dart';
import '../Entities/user.dart';

abstract class BaseRepository {
  //TODO: implement parameters
  ///Fetches [Recipe] data by given parameters
  Future<Recipe> getRecipe();

  ///Fetches recipes summaries for given [Category].
  Future<List<RecipeSummary>> getRecipesByCategory(Category category);

  ///Fetches all categories.
  Future<List<Category>> fetchCategories();

  ///Fetches bookmarks of given [User].
  Future<List<RecipeSummary>> getBookmarks(User user);
}
