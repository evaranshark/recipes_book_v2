import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeEmpty());
}
