import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/states/recipes_states.dart';

import '../../Domain/Entities/recipe_summary.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesEmpty());
  List<RecipeSummary>? recipes;

  void loadRecipesByCategory({required String categoryId}) async {
    emit(RecipesLoading());
    await Future.delayed(Duration(seconds: 2));

    emit(RecipesLoaded(recipes: recipes ?? []));
  }
}
