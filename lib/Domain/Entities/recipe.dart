import 'package:equatable/equatable.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_step.dart';

import 'ingredient.dart';

/// Contains data of particular recipe.
class Recipe extends Equatable {
  /// Unique id of recipe. Connects with model.
  final String id;

  /// Title of this recipe.
  final String title;

  /// Steps to perform in this recipe.
  final List<RecipeStep> steps;

  /// List of ingredients for this recipe
  final List<Ingredient> indgredients;

  const Recipe({
    required this.id,
    required this.title,
    required this.steps,
    required this.indgredients,
  });

  @override
  List<Object?> get props => [id, title];
}
