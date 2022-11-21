import '../../models/recipe_summary_model.dart';
/// Current implementations are:
/// * RecipesEmpty
/// * RecipesLoading
/// * RecipesLoaded
/// * RecipesLoadFailed
abstract class RecipesState {}

class RecipesEmpty implements RecipesState {}

class RecipesLoading implements RecipesState {}

class RecipesLoaded implements RecipesState {
  List<RecipeSummaryModel> recipes;
  RecipesLoaded({required this.recipes});
}

class RecipesLoadFailed implements RecipesState {}