import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/app_data.dart';
import 'package:recipes_book_v2/Presentation/Controllers/bottom_navigation_handler.dart';
import 'package:recipes_book_v2/bloc/states/app_state.dart';

import '../../bloc/blocs/appstate_bloc.dart';

class EvaBottomNavBar extends StatefulWidget {
  EvaBottomNavBar({this.onSelected});

  @override
  State<StatefulWidget> createState() => EvaBottomNavBarState();

  Function(NavBarAliases)? onSelected;
}

class EvaBottomNavBarState extends State<EvaBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    List<NavigationDestination> items = AppData.bottomNavBarItemsData
        .map((e) => NavigationDestination(
            icon: Icon(e.icon),
            selectedIcon: Icon(e.activeIcon),
            label: e.label))
        .toList();
    return NavigationBar(
        destinations: items,
        onDestinationSelected: (index) => _onItemSelected(context, index),
        selectedIndex:
            context.read<AppStateBloc>().state.navigationBarState.currentIndex);
  }

  _onItemSelected(BuildContext context, int index) async {
    switch (index) {
      case 0:
        context
            .read<AppStateBloc>()
            .updateNavBarState(NavBarState.categories());
        break;
      case 1:
        context.read<AppStateBloc>().updateNavBarState(NavBarState.settings());
        break;
    }
    widget.onSelected?.call(AppData.bottomNavBarItemsData[index].alias);
    setState(() {});
  }
}
