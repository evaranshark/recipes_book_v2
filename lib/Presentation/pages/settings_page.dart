import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/bloc/cubits/theme_cubit.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';
import 'package:recipes_book_v2/Utils/widgets/theme_mode_switch.dart';
import 'package:recipes_book_v2/locator.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var router = locator.get<EvaRouterDelegate>();
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      bottomNavigationBar: EvaBottomNavBar(),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Card(child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
                builder: (context, state) {
              return ListTile(
                title: Text("Тема"),
                trailing: SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VerticalDivider(),
                      ThemeModeSwitch(
                        onChanged: (mode) => _onChangeThemeMode(context, mode),
                        themeMode: state.mode,
                      ),
                    ],
                  ),
                ),
              );
            }))),
      ),
    );
  }

  _onChangeThemeMode(BuildContext context, ThemeMode mode) {
    context.read<ThemeModeCubit>().selectMode(mode);
  }
}
