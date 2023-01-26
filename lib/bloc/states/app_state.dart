class AppState {
  final NavBarState navigationBarState;

  AppState({required this.navigationBarState});
  AppState copyWith({navigationBarState}) => AppState(
      navigationBarState: navigationBarState ?? this.navigationBarState);
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
