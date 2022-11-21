
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryFirebaseModel extends Equatable {
  const CategoryFirebaseModel({required this.id, required this.name, this.iconRef});

  final String name;
  final String? iconRef;
  final String id;

  factory CategoryFirebaseModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return CategoryFirebaseModel(
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