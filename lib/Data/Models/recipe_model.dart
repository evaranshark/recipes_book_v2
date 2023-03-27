import 'package:flutter/cupertino.dart';
import 'package:recipes_book_v2/Data/Models/recipe_summary_model.dart';
import 'package:recipes_book_v2/Data/Models/units.dart';
import 'package:recipes_book_v2/Domain/Entities/Adapters/recipe_adapter.dart';
import 'package:recipes_book_v2/Domain/Entities/ingredient.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_step.dart';

class RecipeModel {
  final String id;
  final Iterable<RecipeStepModel> steps;
  final Iterable<IngredientModel>? ingredients;
  final RecipeSummaryModel? summary;

  RecipeModel({
    required this.id,
    required this.steps,
    this.ingredients,
    this.summary,
  });

  RecipeModel copyWith({
    summary,
    ingredients,
    steps,
  }) =>
      RecipeModel(
        id: id,
        steps: steps ?? this.steps,
        ingredients: ingredients ?? this.ingredients,
        summary: summary ?? this.summary,
      );
}

class IngredientModel {
  final String id;
  final String name;
  final String unit;
  final num amount;

  IngredientModel({
    required this.id,
    required this.name,
    required this.unit,
    required this.amount,
  });
}

class RecipeStepModel {
  final int number;
  final Iterable<String> content;
  final String? title;

  RecipeStepModel({
    required this.number,
    required this.content,
    this.title,
  });
}

class RecipeModelAdapter implements RecipeAdapter<RecipeModel> {
  @override
  Recipe cast(RecipeModel source) {
    var stepAdapter = RecipeStepModelAdapter();
    var ingredientAdapter = IngredientModelAdapter();
    var ingredients = source.ingredients!.map((e) => ingredientAdapter.cast(e));
    return Recipe(
      id: source.id,
      indgredients: ingredients,
      steps: source.steps.map((e) => stepAdapter.cast(e)),
      summary: RecipeSummaryModelAdapter().cast(source.summary!),
    );
  }
}

class RecipeStepModelAdapter implements RecipeStepAdapter<RecipeStepModel> {
  @override
  RecipeStep cast(RecipeStepModel source) {
    debugPrint("RecipeStepAdapter");
    var result = RecipeStep(
        title: source.title, content: source.content, number: source.number);
    return result;
  }
}

class IngredientModelAdapter implements IngredientAdapter<IngredientModel> {
  @override
  Ingredient cast(IngredientModel source) {
    return Ingredient(
      id: source.id,
      name: source.name,
      units: UnitsResolver().getUnits(source.unit),
      amount: source.amount,
    );
  }
}
