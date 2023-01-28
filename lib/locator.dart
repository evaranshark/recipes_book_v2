import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_book_v2/Data/Converters/converters.dart';
import 'package:recipes_book_v2/Data/Data%20Sources/firebase_source.dart';
import 'package:recipes_book_v2/Data/Repositories/main_repository.dart';
import 'package:recipes_book_v2/Data/base_data_source.dart';
import 'package:recipes_book_v2/Domain/Repositories/base_repository.dart';
import 'package:recipes_book_v2/Utils/router.dart';

var locator = GetIt.instance;

Future<void> setup() async {
  locator.registerSingleton<EvaRouterDelegate>(EvaRouterDelegate());
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  _registerConverters();

  locator.registerSingleton<BaseDataSource>(FirebaseSource());
  locator.registerSingleton<BaseRepository>(MainRepository());
}

void _registerConverters() {
  locator.registerSingleton<CategoryModelConverter>(
    CategoryModelConverter(),
  );
  locator.registerSingleton<RecipeSummaryModelConverter>(
      RecipeSummaryModelConverter());
}
