import 'package:equatable/equatable.dart';

class RecipeSummaryModel implements Equatable{

  late final String _name;
  late final String _id;

  String get name => _name;
  String get id => _id;

  RecipeSummaryModel({required id, required name}) {
    _name = name;
    _id = id;
  }

  @override
  List<Object?> get props => [_id, _name];

  @override
  bool? get stringify => true;
}
