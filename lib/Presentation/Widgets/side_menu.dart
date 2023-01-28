import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../app_data.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    var destinations = AppData.destinations
        .map(
          (e) => NavigationDestination(icon: Icon(e.icon), label: e.label),
        )
        .toList();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250, minWidth: 200),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(destinations: destinations),
      ),
    );
  }
}
