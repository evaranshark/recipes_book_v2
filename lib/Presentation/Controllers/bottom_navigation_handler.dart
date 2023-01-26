import 'package:flutter/material.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/locator.dart';

import '../../app_data.dart';

class BottomNavigationHandler {
  BottomNavigationHandler._internal();
  static final BottomNavigationHandler _instance =
      BottomNavigationHandler._internal();

  factory BottomNavigationHandler() => _instance;
  final _router = locator.get<EvaRouterDelegate>();

  onDestinationChanged(NavBarAliases alias) {
    try {
      switch (alias) {
        case NavBarAliases.categories:
          _router.pushPage(name: AppData.appRoutes.categories);
          break;
        case NavBarAliases.settings:
          _router.pushPage(name: AppData.appRoutes.settings);
          break;
        default:
          break;
      }
    } on Exception catch (e) {
      throw Exception("Navigator state not found");
    }
  }
}
