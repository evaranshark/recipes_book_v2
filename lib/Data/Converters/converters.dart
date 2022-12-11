import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/Data/Models/category_model.dart';

abstract class Converter<Model> {
  Model fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options);
  Map<String, dynamic> toFirestore(Model model);
}

class CategoryModelConverter implements Converter<CategoryModel> {
  CategoryModel fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CategoryModel(
      id: snapshot.id,
      title: data?['name_ru'] ?? data?['name'],
    );
  }

  Map<String, dynamic> toFirestore(CategoryModel model) {
    return {
      'name': model.title,
    };
  }
}
