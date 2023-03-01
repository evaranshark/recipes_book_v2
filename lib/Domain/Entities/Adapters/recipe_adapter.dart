import '../../../Utils/adapter.dart';
import '../ingredient.dart';
import '../recipe.dart';
import '../recipe_step.dart';

abstract class RecipeAdapter<From> extends Adapter<From, Recipe> {}

abstract class RecipeStepAdapter<From> extends Adapter<From, RecipeStep> {}

abstract class IngredientAdapter<From> extends Adapter<From, Ingredient> {}
