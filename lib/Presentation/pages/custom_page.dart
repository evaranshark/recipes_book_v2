import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/bloc/states/app_state.dart';
import 'package:recipes_book_v2/locator.dart';

import '../../Utils/widgets/bottom_nav_bar.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EvaBottomNavBar(),
      body: Router(
        routerDelegate: locator.get<EvaRouterDelegate>(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
