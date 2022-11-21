import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/events/categories_events.dart';
import 'package:recipes_book_v2/bloc/states/categories_states.dart';
import '../../repos/categories_repo.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

  late CategoriesRepository repository;
  bool _isBusy = false;

  CategoriesBloc({required this.repository}) : super(CategoriesIdle()){
    on<LoadCategories>(_onLoadCategories);
  }

  _delay() async {
    _isBusy = true;
    await (Future.delayed(Duration(seconds: 1)));
    _isBusy = false;
}

  _onLoadCategories(CategoriesEvent event, Emitter<CategoriesState> emit) async{
    if (!_isBusy) {
      //_delay();
      emit(CategoriesLoadStarted());
      await repository.fetchCategories();
      emit(CategoriesLoadCompleted(categories: repository.categories));
    }
  }

}