import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/states/recipes_states.dart';

import '../../Domain/Entities/category.dart';
import '../../Domain/Entities/recipe_summary.dart';
import '../../Domain/Repositories/base_repository.dart';
import '../../locator.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesEmpty());
  var repository = locator.get<BaseRepository>();
  List<RecipeSummary>? recipes;

  void loadRecipesByCategory({required Category category}) async {
    emit(RecipesLoading());
    recipes = await repository.fetchRecipesByCategory(category);
    emit(RecipesLoaded(recipes: recipes ?? []));
  }
}
