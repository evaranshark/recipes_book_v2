import 'package:recipes_book_v2/Domain/Entities/recipe.dart';

import '../../Domain/Entities/category.dart';

class AppState {
  final NavBarState navigationBarState;
  final Category? category;
  final Recipe? recipe;

  AppState({required this.navigationBarState, this.category, this.recipe});
  AppState copyWith({
    navigationBarState,
    category,
    recipe,
  }) =>
      AppState(
        navigationBarState: navigationBarState ?? this.navigationBarState,
        category: category ?? this.category,
        recipe: recipe ?? this.recipe,
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
