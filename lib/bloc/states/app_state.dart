import 'package:recipes_book_v2/Domain/Entities/recipe.dart';

import '../../Domain/Entities/category.dart';
import '../../Domain/Entities/recipe_summary.dart';

class AppState {
  final NavBarState navigationBarState;
  final String appBarTitle;
  final bool blockNavBar;

  AppState({
    required this.navigationBarState,
    this.appBarTitle = "",
    this.blockNavBar = false,
  });
  AppState copyWith({
    navigationBarState,
    appBarTitle,
    blockNavBar,
  }) =>
      AppState(
        navigationBarState: navigationBarState ?? this.navigationBarState,
        appBarTitle: appBarTitle ?? this.appBarTitle,
        blockNavBar: blockNavBar ?? this.blockNavBar,
      );
}

enum NavigationScope { categories, settings, bookmarks }

class NavBarState {
  final NavigationScope scope;
  final int currentIndex;
  NavBarState._({required this.scope, required this.currentIndex});
  factory NavBarState.categories() =>
      NavBarState._(scope: NavigationScope.categories, currentIndex: 0);
  factory NavBarState.bookmarks() =>
      NavBarState._(scope: NavigationScope.bookmarks, currentIndex: 0);
  factory NavBarState.settings() =>
      NavBarState._(scope: NavigationScope.settings, currentIndex: 1);
  NavBarState updateState(int index) {
    switch (index) {
      case 1:
        return NavBarState.settings();
      case 0:
        if (scope != NavigationScope.categories) {
          return NavBarState.categories();
        } else {
          return NavBarState.bookmarks();
        }
      default:
        return NavBarState.categories();
    }
  }
}
