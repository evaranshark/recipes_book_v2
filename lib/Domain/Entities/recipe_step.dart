import 'package:equatable/equatable.dart';

class RecipeStep extends Equatable {
  String? title;
  String content;

  RecipeStep({required this.content, this.title});

  @override
  List<Object?> get props => [title, content];
}
