import 'package:recipes_book_v2/firebase/models/category_firebase_model.dart';

import '../models/category_model.dart';
import 'database.dart';

class CategoriesRepository {

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  Future<void> fetchCategories() async {
    List<CategoryModel> categories = [];
    List<CategoryFirebaseModel> fbCategoryModels = [];
    fbCategoryModels = await DataBase.instance.fetchCategories();
    categories.clear();
    for (CategoryFirebaseModel item in fbCategoryModels) {
      if (item.iconRef != null) {
       String iconUri =  await DataBase.instance.getCategoryIconUri(item.iconRef!);
       categories.add(CategoryModel(id: item.id, name: item.name, iconUri: iconUri));
      }
    }
    _categories = categories;
  }
}