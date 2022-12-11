import 'package:flutter/material.dart';
import 'package:recipes_book_v2/Presentation/Controllers/navigation_controller.dart';

class CategoriesSectionPage extends StatelessWidget {
  CategoriesSectionPage({Key? key}) : super(key: key);
  static final NavigationController _navigationController =
      NavigationController.categories();
  static final Navigator _navigator = Navigator(
    key: _navigationController.navigatorKey,
    onGenerateRoute: _navigationController.onGenerateRoute,
    initialRoute: _navigationController.initialRoute,
  );

  @override
  Widget build(BuildContext context) {
    return _navigator;
  }
}
