import 'package:recipes_book_v2/Domain/Entities/recipe.dart';

import '../../Domain/Entities/category.dart';
import '../../Domain/Entities/recipe_summary.dart';

class AppState {
  final NavBarState navigationBarState;
  final Category? category;
  final Recipe? recipe;
  final RecipeSummary? recipeSummary;

  AppState({
    required this.navigationBarState,
    this.category,
    this.recipe,
    this.recipeSummary,
  });
  AppState copyWith({
    navigationBarState,
    category,
    recipe,
    recipeSummary,
  }) =>
      AppState(
        navigationBarState: navigationBarState ?? this.navigationBarState,
        category: category ?? this.category,
        recipe: recipe ?? this.recipe,
        recipeSummary: recipeSummary ?? this.recipeSummary,
      );
}

enum NavigationScope { categories, settings }

class NavBarState {
  final NavigationScope scope;
  final int currentIndex;
  NavBarState._({required this.scope, required this.currentIndex});
  factory NavBarState.categories() =>
      NavBarState._(scope: NavigationScope.categories, currentIndex: 0);
  factory NavBarState.settings() =>
      NavBarState._(scope: NavigationScope.settings, currentIndex: 1);
}
