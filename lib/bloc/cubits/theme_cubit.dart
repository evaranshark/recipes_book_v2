import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeState {
  final ThemeMode mode;
  ThemeModeState({required this.mode});
}

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit(): super(ThemeModeState(mode: ThemeMode.system));

  void selectMode(ThemeMode mode) {
    emit(ThemeModeState(mode: mode));
  }
}