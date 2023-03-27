import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Presentation/pages/categories_page.dart';
import 'package:recipes_book_v2/Presentation/pages/recipe_page.dart';
import 'package:recipes_book_v2/Presentation/pages/recipes_page.dart';
import 'package:recipes_book_v2/Presentation/pages/settings_page.dart';
import 'package:recipes_book_v2/Utils/route_handler.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';

import '../bloc/states/app_state.dart';

class EvaRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final _categoriesHandler = RouteHandler(
    pages: <Page>[MaterialPage(name: '/categories', child: CategoriesPage())],
  );
  final _settingsHandler = RouteHandler(pages: <Page>[
    const MaterialPage(name: '/settings', child: SettingsPage())
  ]);
  RouteHandler? _activeHandler;
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _pages = <Page>[];
  late NavigationScope _scope;
  HeroController _heroController = HeroController();

  EvaRouterDelegate() {
    _categoriesHandler.addListener(() {
      notifyListeners();
    });
    _settingsHandler.addListener(() {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _categoriesHandler.removeListener(notifyListeners);
    _settingsHandler.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppState>(builder: ((context, state) {
      _scope = state.navigationBarState.scope;
      _activeHandler = _scope != NavigationScope.settings
          ? _categoriesHandler
          : _settingsHandler;
      _pages.clear();
      _pages.addAll(_activeHandler!.pages);
      return HeroControllerScope(
        controller: _heroController,
        child: Navigator(
          key: navigatorKey,
          pages: List.of(_pages),
          onPopPage: onPopPage,
        ),
      );
    }));
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    // TODO: implement setNewRoutePath
    return Future.value(null);
  }

  bool onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  @override
  Future<bool> popRoute() {
    if (_activeHandler!.popRoute()) {
      notifyListeners();
      return Future.value(true);
    }
    return _confirmAppExit();
  }

  Future<bool> _confirmAppExit() async {
    return showDialog<bool>(
        context: navigatorKey!.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        }).then((value) => Future.value(value));
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget? child;
    switch (routeSettings.name) {
      case '/categories':
        if (routeSettings.arguments == null) {
          child = CategoriesPage();
        } else {
          child = RecipesPage(
              arguments: routeSettings.arguments as Map<String, String>);
        }
        break;
      case '/settings':
        child = const SettingsPage();
        break;
      case '/recipe':
        child = RecipePage(
            arguments: routeSettings.arguments as Map<String, String>);
        break;
      default:
        break;
    }
    return MaterialPage(
      child: child ?? Center(),
      key: ValueKey(routeSettings.name! +
          DateTime.now().microsecondsSinceEpoch.toString()),
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }

  void pushPage({required String name, dynamic arguments}) {
    _activeHandler!.pages.clear();
    _activeHandler!.pages.addAll(_pages);
    _activeHandler!
        .pushPage(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  @override
  List<Page> get currentConfiguration => List.of(_pages);
}
