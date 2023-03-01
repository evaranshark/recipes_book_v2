import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/Data/Models/category_model.dart';
import 'package:recipes_book_v2/Data/Models/recipe_summary_model.dart';
import 'package:recipes_book_v2/locator.dart';

import '../Models/recipe_model.dart';

abstract class Converter<Model> {
  Model fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options);
  Map<String, dynamic> toFirestore(Model model, SetOptions? options);
}

class CategoryModelConverter implements Converter<CategoryModel> {
  @override
  CategoryModel fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CategoryModel(
      id: snapshot.id,
      path: snapshot.reference.path,
      title: data?['name_ru'] ?? data?['name'],
    );
  }

  @override
  Map<String, dynamic> toFirestore(CategoryModel model, SetOptions? options) {
    return {
      'name': model.title,
    };
  }
}

class RecipeSummaryModelConverter implements Converter<RecipeSummaryModel> {
  @override
  RecipeSummaryModel fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return RecipeSummaryModel(
      id: snapshot.id,
      title: data?['name'] ?? '',
      summary: data?['description'],
      averageTime: data?['averageTime'],
      recipe: data?['recipe'],
    );
  }

  @override
  Map<String, dynamic> toFirestore(
      RecipeSummaryModel model, SetOptions? options) {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}

class RecipeModelConverter implements Converter<RecipeModel> {
  @override
  RecipeModel fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return RecipeModel(
        id: snapshot.id,
        steps: (data!['steps'] as Iterable).map((e) => RecipeStepModel(
              number: e['number'],
              content: e['content'],
              title: e['title'],
            )));
  }

  @override
  Map<String, dynamic> toFirestore(RecipeModel model, SetOptions? options) {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}

class IngredientModelConverter implements Converter<IngredientModel> {
  @override
  IngredientModel fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return IngredientModel(
      id: snapshot.id,
      name: snapshot.data()!['name'],
      unit: snapshot.data()!['unit'],
      amount: snapshot.data()!['amount'],
    );
  }

  @override
  Map<String, dynamic> toFirestore(IngredientModel model, SetOptions? options) {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}
