import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/pages/categories_page.dart';
import 'package:recipes_book_v2/pages/unknown_page.dart';

import '../app_data.dart';
import '../bloc/blocs/categories_bloc.dart';
import '../bloc/events/categories_events.dart';
import '../pages/categories_section_page.dart';
import '../pages/recipes_page.dart';
import '../pages/settings_page.dart';

abstract class NavigationController {
  NavigationController._();
  Route<dynamic> onGenerateRoute(RouteSettings settings);
  final String initialRoute = "";
  GlobalKey<NavigatorState> get navigatorKey;

  factory NavigationController.sections() => _SectionsNavigatorController();
  factory NavigationController.categories() => _CategoriesNavigationController();

}

class _SectionsNavigatorController implements NavigationController {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  _SectionsNavigatorController._();
  static final _SectionsNavigatorController _instance = _SectionsNavigatorController._();
  factory _SectionsNavigatorController() => _instance;

  @override
  final String initialRoute = AppData.appRoutes.categories;

  @override
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppData.appRoutes.settings) {
      return MaterialPageRoute(builder: (context) => const SettingsPage(), settings: settings);
    }
    if (settings.name == AppData.appRoutes.categories) {
      return MaterialPageRoute(builder: (context) {
        return CategoriesSectionPage();
      }, settings: settings);
    }
    if (settings.name == AppData.appRoutes.recipes) {
      return MaterialPageRoute(builder: (context) => RecipesPage(), settings: settings);
    }
    return MaterialPageRoute(builder: (context) => const UnknownPage(), settings: settings);

  }
}

class _CategoriesNavigationController implements NavigationController {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  _CategoriesNavigationController._();
  static final _CategoriesNavigationController _instance = _CategoriesNavigationController._();
  factory _CategoriesNavigationController() => _instance;
  static String? _currentRoute;

  @override
  String get initialRoute => AppData.appRoutes.categories;

  @override
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppData.appRoutes.categories) {
      return MaterialPageRoute(builder: (context) => CategoriesPage(), settings: settings, maintainState: false);
    }
    if (settings.name == AppData.appRoutes.recipes) {
      return MaterialPageRoute(builder: (context) => RecipesPage(), settings: settings);
    }
    return MaterialPageRoute(builder: (context) => const UnknownPage(), settings: settings);
  }


}