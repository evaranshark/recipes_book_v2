import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteHandler with ChangeNotifier {
  final List<Page> pages;
  bool popRoute() {
    if (pages.length > 1) {
      pages.removeLast();
      return true;
    }
    return false;
  }

  RouteHandler({required this.pages});

  void pushPage(Page page) {
    pages.add(page);
    notifyListeners();
  }
}
