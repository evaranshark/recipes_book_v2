import '../../Domain/Entities/recipe.dart';

abstract class RecipeState {}

class RecipeLoaded implements RecipeState {
  final Recipe data;
  RecipeLoaded({required this.data});
}

class RecipeLoading implements RecipeState {}

class RecipeEmpty implements RecipeState {}

class RecipeError implements RecipeState {
  final Error error;
  RecipeError({required this.error});
}
