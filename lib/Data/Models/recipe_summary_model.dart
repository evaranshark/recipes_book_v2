import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';

import '../../Domain/Entities/Adapters/recipe_summary_adapter.dart';

class RecipeSummaryModel {
  final String id;
  final String title;
  final String summary;
  final String averageTime;
  final String recipeRef;
  const RecipeSummaryModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.averageTime,
    required this.recipeRef,
  });
}

class RecipeSummaryModelAdapter
    implements RecipeSummaryAdapter<RecipeSummaryModel> {
  @override
  RecipeSummary cast(RecipeSummaryModel source) {
    return RecipeSummary(
      id: source.id,
      title: source.title,
      summary: source.summary,
      averageTime: source.averageTime,
      recipeRef: source.recipeRef,
    );
  }
}
