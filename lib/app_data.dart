import 'package:flutter/material.dart';

class AppData {
  static List<NaviDestination> destinations = <NaviDestination>[
    NaviDestination(
        alias: NavBarAliases.categories,
        icon: Icons.menu_outlined,
        label: "Категории"),
    NaviDestination(
        alias: NavBarAliases.settings,
        icon: Icons.settings_outlined,
        label: "Настройки")
  ];

  static AppRoutes get appRoutes => AppRoutes();
}

enum NavBarAliases { categories, settings }

class AppRoutes {
  AppRoutes.internal();
  static final AppRoutes _instance = AppRoutes.internal();

  factory AppRoutes() => _instance;

  String get categories => "/categories";
  String get settings => "/settings";
  String get recipes => "/recipes";
}

class NaviDestination {
  IconData icon;
  String label;
  NavBarAliases alias;

  NaviDestination(
      {required this.alias, required this.icon, required this.label});
}
