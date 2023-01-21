import 'package:equatable/equatable.dart';

class RecipeStep extends Equatable {
  final String? title;
  final String content;

  const RecipeStep({required this.content, this.title});

  @override
  List<Object?> get props => [title, content];
}
