import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeState {
  final ThemeMode mode;
  ThemeModeState({required this.mode});
}

class ThemeModeCubit extends Cubit<ThemeModeState> {
  var prefs = locator.get<SharedPreferences>(instanceName: 'prefs');
  ThemeModeCubit() : super(ThemeModeState(mode: ThemeMode.system)) {
    if (prefs.containsKey('themeMode')) {
      var prefsMode = prefs.getString('themeMode');
      switch (prefsMode) {
        case "light":
          emit(ThemeModeState(mode: ThemeMode.light));
          break;
        case 'dark':
          emit(ThemeModeState(mode: ThemeMode.dark));
          break;
        default:
          emit(ThemeModeState(mode: ThemeMode.system));
          break;
      }
    }
  }

  void selectMode(ThemeMode mode) {
    prefs.setString('themeMode', mode.name);

    emit(ThemeModeState(mode: mode));
  }
}
