import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_state.dart';

import '../../Domain/Entities/recipe.dart';
import '../../Domain/Repositories/base_repository.dart';
import '../../locator.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeEmpty());

  var repository = locator.get<BaseRepository>();
  Recipe? recipe;

  void selectRecipe(String recipeId) async {
    emit(RecipeLoading());
    recipe = await repository.fetchRecipe(recipeId);

    emit(RecipeLoaded(data: recipe!));
  }
}
