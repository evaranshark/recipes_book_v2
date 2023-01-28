import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';

/// Current implementations are:
/// * RecipesEmpty
/// * RecipesLoading
/// * RecipesLoaded
/// * RecipesLoadFailed
abstract class RecipesState {}

class RecipesEmpty implements RecipesState {}

class RecipesLoading implements RecipesState {}

class RecipesLoaded implements RecipesState {
  List<RecipeSummary> recipes;
  RecipesLoaded({required this.recipes});
}

class RecipesLoadFailed implements RecipesState {
  final Error error;
  RecipesLoadFailed({required this.error});
}
