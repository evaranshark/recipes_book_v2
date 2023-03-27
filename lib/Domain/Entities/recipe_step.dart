import 'package:equatable/equatable.dart';

class RecipeStep extends Equatable {
  final String? title;
  final Iterable<String> content;
  final int number;

  const RecipeStep({required this.content, this.title, required this.number});

  @override
  List<Object?> get props => [title, content, number];
}
