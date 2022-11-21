import 'package:flutter/material.dart';

class AppData {

  static List<BottomNavBarItemData> bottomNavBarItemsData = <BottomNavBarItemData> [
    BottomNavBarItemData(alias: NavBarAliases.categories, icon: Icons.menu_outlined, activeIcon: Icons.menu, label: "Категории"),
    BottomNavBarItemData(alias: NavBarAliases.settings, icon: Icons.settings_outlined, activeIcon: Icons.settings_rounded, label: "Настройки")
  ];

  static AppRoutes get appRoutes => AppRoutes();

}

enum NavBarAliases {
  categories,
  settings
}

class AppRoutes {
  AppRoutes.internal();
  static final AppRoutes _instance = AppRoutes.internal();

  factory AppRoutes() => _instance;

  String get categories => "/categories";
  String get settings => "/settings";
  String get recipes => "/recipes";
}

class BottomNavBarItemData {
  IconData icon;
  IconData activeIcon;
  String label;
  NavBarAliases alias;

  BottomNavBarItemData(
      {
        required this.alias,
        required this.icon,
        required this.activeIcon,
        required this.label
      }
  );
}
