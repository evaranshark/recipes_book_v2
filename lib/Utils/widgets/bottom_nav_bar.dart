import 'package:flutter/material.dart';
import 'package:recipes_book_v2/app_data.dart';
import 'package:recipes_book_v2/Presentation/Controllers/bottom_navigation_handler.dart';

class EvaBottomNavBar extends StatefulWidget {
  GlobalKey<NavigatorState> navigatorKey;
  EvaBottomNavBar({this.onSelected, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() => EvaBottomNavBarState();

  Function(NavBarAliases)? onSelected;
}

class EvaBottomNavBarState extends State<EvaBottomNavBar> {
  BottomNavigationHandler navigationHandler = BottomNavigationHandler();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<NavigationDestination> items = AppData.destinations
        .map((e) => NavigationDestination(icon: Icon(e.icon), label: e.label))
        .toList();
    return NavigationBar(
        destinations: items,
        onDestinationSelected: _onItemSelected,
        selectedIndex: _selectedIndex);
  }

  _onItemSelected(int index) async {
    navigationHandler.onDestinationChanged(AppData.destinations[index].alias);
    widget.onSelected?.call(AppData.destinations[index].alias);
    setState(() {
      _selectedIndex = index;
    });
  }
}
