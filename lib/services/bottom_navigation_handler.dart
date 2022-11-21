import 'package:flutter/material.dart';

import '../app_data.dart';

class BottomNavigationHandler {

  BottomNavigationHandler._internal();
  static final BottomNavigationHandler _instance = BottomNavigationHandler._internal();

  factory BottomNavigationHandler() => _instance;
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _key;

  onDestinationChanged(NavBarAliases alias) {
    try {
      switch (alias) {
        case NavBarAliases.categories :
          _key.currentState?.pushNamed(AppData.appRoutes.categories);
          break;
        case NavBarAliases.settings :
          _key.currentState?.pushNamed(AppData.appRoutes.settings);
          break;
        default :
          break;
      }
    } on Exception catch (e) {
      throw Exception("Navigator state not found");
    }
  }
}