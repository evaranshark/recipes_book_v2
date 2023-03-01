import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';

import '../../Domain/Entities/category.dart';
import '../states/app_state.dart';

class AppStateBloc extends Cubit<AppState> {
  AppStateBloc()
      : super(AppState(navigationBarState: NavBarState.categories()));

  void updateNavBarState(NavBarState navBarState) =>
      emit(state.copyWith(navigationBarState: navBarState));
  void notifyUpdate() => emit(state.copyWith());
  void selectCategory(Category category) =>
      emit(state.copyWith(category: category));
  void selectRecipe(Recipe recipe) => emit(state.copyWith(recipe: recipe));
  void selectRecipeSummary(RecipeSummary recipeSummary) =>
      emit(state.copyWith(recipe: recipeSummary));
  void closeCategory() => emit(state.copyWith(category: null));
  void closeRecipe() => emit(state.copyWith(recipe: null));
  void clearRecipeSummary() => emit(state.copyWith(recipeSummary: null));
}
