import 'package:equatable/equatable.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_step.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';

import 'ingredient.dart';

/// Contains data of particular recipe.
class Recipe extends Equatable {
  /// Unique id of recipe. Connects with model.
  final String id;

  final RecipeSummary summary;

  /// Steps to perform in this recipe.
  final Iterable<RecipeStep> steps;

  /// List of ingredients for this recipe
  final Iterable<Ingredient> indgredients;

  const Recipe({
    required this.id,
    required this.summary,
    required this.steps,
    required this.indgredients,
  });

  @override
  List<Object?> get props => [id, summary.id];
}
