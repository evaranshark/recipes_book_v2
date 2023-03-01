import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/Data/Models/recipe_model.dart';
import 'package:recipes_book_v2/Data/Models/category_model.dart';
import 'package:recipes_book_v2/Data/Models/recipe_summary_model.dart';
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
            toFirestore: converter.toFirestore)
        .get();
    return data.docs.map((e) => e.data()).toList();
  }

  @override
  Future<RecipeModel> fetchRecipe(BaseDataSourceParams params) async {
    var firebase = locator.get<FirebaseFirestore>();
    var recipeConverter = locator.get<RecipeModelConverter>();
    var summaryConverter = locator.get<RecipeSummaryModelConverter>();
    var ingredientConverter = locator.get<IngredientModelConverter>();
    var recipeDoc = firebase.collection('recipes').doc(params.recipeId);
    var recipeSnapshot = await recipeDoc.get();
    if (recipeSnapshot.data() == null) {
      throw Exception("Getting recipe data from datasource failed.");
    }
    var ingredientsRef = recipeDoc.collection('ingredients');
    var summary = firebase
        .doc(recipeSnapshot.data()!['summary'])
        .withConverter(
          fromFirestore: summaryConverter.fromFirestore,
          toFirestore: summaryConverter.toFirestore,
        )
        .get();
    RecipeModel recipe = recipeConverter.fromFirestore(recipeSnapshot, null)
      ..copyWith(
        summary: summary,
        ingredients: ingredientsRef
            .withConverter(
              fromFirestore: ingredientConverter.fromFirestore,
              toFirestore: ingredientConverter.toFirestore,
            )
            .get(),
      );
    return recipe;
  }

  @override
  Future<List<RecipeSummaryModel>> fetchRecipesByCategory(
      BaseDataSourceParams params) async {
    var firebase = locator.get<FirebaseFirestore>();
    var converter = locator.get<RecipeSummaryModelConverter>();
    var data = await firebase
        .collection('recipe_summaries')
        .withConverter(
          fromFirestore: converter.fromFirestore,
          toFirestore: converter.toFirestore,
        )
        .where('category', isEqualTo: params.categoryId)
        .get();
    return data.docs.map((e) => e.data()).toList();
  }
}
