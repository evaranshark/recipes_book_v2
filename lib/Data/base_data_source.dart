import '/Data/Models/category_model.dart';

abstract class BaseDataSource {
  Future<List<CategoryModel>> fetchCategories();
}
