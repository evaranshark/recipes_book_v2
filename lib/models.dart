import 'package:flutter/material.dart';

import 'app_data.dart';

class NavBarState with ChangeNotifier {
  int index = 0;

  void setIndexSelected(int i) {
    index = i;
    notifyListeners();
  }

  void onGenerateRoute() {
    notifyListeners();
  }
}