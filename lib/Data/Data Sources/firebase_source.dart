import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/Data/Models/recipe_model.dart';
import 'package:recipes_book_v2/Data/Models/category_model.dart';
import 'package:recipes_book_v2/Data/base_data_source.dart';
import 'package:recipes_book_v2/locator.dart';
import '/Data/Converters/converters.dart';

class FirebaseSource implements BaseDataSource {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    var firebase = locator.get<FirebaseFirestore>();
    var converter = locator.get<CategoryModelConverter>();
    var data = await firebase
        .collection('categories')
        .withConverter(
            fromFirestore: converter.fromFirestore,
            toFirestore: (CategoryModel value, options) =>
                converter.toFirestore(value))
        .get();
    return data.docs.map((e) => e.data()).toList();
  }

  @override
  Future<RecipeModel> fetchRecipe() {
    // TODO: implement fetchRecipe
    throw UnimplementedError();
  }
}
