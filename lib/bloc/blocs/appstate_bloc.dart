import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';

import '../../Domain/Entities/category.dart';
import '../states/app_state.dart';

class AppStateBloc extends Cubit<AppState> {
  AppStateBloc()
      : super(AppState(navigationBarState: NavBarState.categories()));

  void updateNavBarState(int index) => emit(state.copyWith(
      navigationBarState: state.navigationBarState.updateState(index)));
  void notifyUpdate() => emit(state.copyWith());
}
