import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/Data/Models/category_model.dart';
import 'package:recipes_book_v2/Data/Models/recipe_summary_model.dart';

abstract class Converter<Model> {
  Model fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options);
  Map<String, dynamic> toFirestore(Model model);
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
  Map<String, dynamic> toFirestore(CategoryModel model) {
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
      recipeRef: (data?['recipe'] as DocumentReference).path,
    );
  }

  @override
  Map<String, dynamic> toFirestore(RecipeSummaryModel model) {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}
