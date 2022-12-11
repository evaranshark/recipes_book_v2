import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/events/categories_events.dart';
import 'package:recipes_book_v2/bloc/states/categories_states.dart';
import '../../Domain/Repositories/base_repository.dart';
import '../../locator.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  var repository = locator.get<BaseRepository>();
  bool _isBusy = false;

  CategoriesBloc() : super(CategoriesIdle()) {
    on<LoadCategories>(_onLoadCategories);
  }

  _onLoadCategories(
      CategoriesEvent event, Emitter<CategoriesState> emit) async {
    if (!_isBusy) {
      //_delay();
      emit(CategoriesLoadStarted());
      var categories = await repository.fetchCategories();
      emit(CategoriesLoadCompleted(categories: categories));
    }
  }
}
