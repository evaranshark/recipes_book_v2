import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_book_v2/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../firebase/models/category_firebase_model.dart';

class DataBase {
  DataBase._();

  static init() async {
    _instance = DataBase._();
    categoriesCollectionRef = _db.collection("categories");

  }
  static late final DataBase _instance;
  static DataBase get instance => _instance;
  static final _storage = FirebaseStorage.instance;
  FirebaseStorage get storage => _storage;
  static final _storageRef = _storage.ref();

  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static late final CollectionReference categoriesCollectionRef;


  Future<List<CategoryFirebaseModel>> fetchCategories() async {
    return categoriesCollectionRef
        .withConverter(
        fromFirestore: CategoryFirebaseModel.fromFirestore,
        toFirestore: (CategoryFirebaseModel model, options) => model.toFirestore()
    )
        .get()
        .then(
            (value) => value.docs.map(
                (e) => e.data()).toList(),
        onError: (e) => throw Exception("Categories data load failed")
    );
  }

  Future<String> getCategoryIconUri(String path) async {
    return await _storageRef.child(path)
        .getDownloadURL()
        .onError((error, stackTrace) => throw Exception("Categories icon uri load failed"));
  }

}
