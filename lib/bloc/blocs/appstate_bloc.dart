import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/app_state.dart';

class AppStateBloc extends Cubit<AppState> {
  AppStateBloc() : super(AppState(navigationBarState: NavBarState.settings()));

  void updateNavBarState(NavBarState navBarState) =>
      emit(state.copyWith(navigationBarState: navBarState));
  void notifyUpdate() => emit(state.copyWith());
}
