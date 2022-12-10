import '/Domain/Entities/Adapters/category_adapter.dart';
import '/Domain/Entities/category.dart';

class CategoryModel {
  final String id, title;
  const CategoryModel({required this.id, required this.title});
}

class CategoryModelAdapter implements CategoryAdapter<CategoryModel> {
  @override
  Category cast(CategoryModel source) {
    return Category(
      id: source.id,
      title: source.title,
    );
  }
}
