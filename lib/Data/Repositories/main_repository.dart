import '../../Domain/Entities/category.dart';
import '../../Domain/Entities/recipe.dart';
import '../../Domain/Entities/recipe_summary.dart';
import '../../Domain/Entities/user.dart';
import '../../Domain/Repositories/base_repository.dart';
import '../Models/category_model.dart';
import '../base_data_source.dart';

class MainRepository implements BaseRepository {
  final BaseDataSource dataSource;
  const MainRepository({required this.dataSource});
  @override
  Future<List<RecipeSummary>> getBookmarks(User user) {
    // TODO: implement getBookmarks
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategories() async {
    var adapter = CategoryModelAdapter();
    var data = await dataSource.fetchCategories();
    return data.map((e) => adapter.cast(e)).toList();
  }

  @override
  Future<Recipe> getRecipe() {
    // TODO: implement getRecipe
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeSummary>> getRecipesByCategory(Category category) {
    // TODO: implement getRecipesByCategory
    throw UnimplementedError();
  }
}
