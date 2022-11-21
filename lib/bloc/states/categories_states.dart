import '../../models/category_model.dart';

abstract class CategoriesState {}

class CategoriesIdle implements CategoriesState {}

class CategoriesLoadStarted implements CategoriesState {}

class CategoriesLoadCompleted implements CategoriesState {
  List<CategoryModel> categories;
  CategoriesLoadCompleted({required this.categories});
}

class CategoriesLoadFailed implements CategoriesState {}