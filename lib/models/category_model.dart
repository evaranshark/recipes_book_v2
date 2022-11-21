
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  const CategoryModel({required this.id, required this.name, this.iconUri, this.iconRef});

  final String name;
  final String? iconUri;
  final String? iconRef;
  final String id;

  factory CategoryModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return CategoryModel(
        id: snapshot.id,
        name: data?['name_ru'] ?? "Unknown",
        iconRef: data?['image_href']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name
    };
  }

  @override
  List<Object?> get props => [id, name];
}