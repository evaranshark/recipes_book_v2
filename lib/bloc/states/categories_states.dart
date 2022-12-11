import '../../Domain/Entities/category.dart';

abstract class CategoriesState {}

class CategoriesIdle implements CategoriesState {}

class CategoriesLoadStarted implements CategoriesState {}

class CategoriesLoadCompleted implements CategoriesState {
  List<Category> categories;
  CategoriesLoadCompleted({required this.categories});
}

class CategoriesLoadFailed implements CategoriesState {}
