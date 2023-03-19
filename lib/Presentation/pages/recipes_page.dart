import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_summary.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/bloc/cubits/recipes_cubit.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_cubit.dart';
import 'package:recipes_book_v2/bloc/states/app_state.dart';
import 'package:recipes_book_v2/bloc/states/recipes_states.dart';

import '../../Domain/Entities/recipe.dart';
import '../../locator.dart';

class RecipesPage extends StatelessWidget {
  RecipesPage({this.arguments});

  Map<String, String>? arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arguments!['categoryName']!),
        ),
        bottomNavigationBar: EvaBottomNavBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BlocBuilder<RecipesCubit, RecipesState>(
              builder: (context, recipesState) {
                if (recipesState is RecipesLoaded) {
                  if (recipesState.recipes.isNotEmpty) {
                    return ListView.builder(
                      itemCount: recipesState.recipes.length,
                      itemBuilder: (context, index) => Card(
                        child: RecipeSummaryTile(
                          recipe: recipesState.recipes[index],
                        ),
                      ),
                    );
                  } else {
                    return Text("Wow, such empty!");
                  }
                }
                if (recipesState is RecipesLoading) {
                  return const CircularProgressIndicator();
                }
                if (recipesState is RecipesEmpty) {
                  return Container();
                }
                if (recipesState is RecipesLoadFailed) {
                  return const Text("Error");
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onPop(BuildContext context) {
    return Future.value(true);
  }
}

class RecipeSummaryTile extends StatelessWidget {
  final RecipeSummary recipe;
  const RecipeSummaryTile({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: ListTile(
          title: Text(recipe.title),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.access_time_rounded),
              Text(recipe.averageTime),
              const Spacer(),
            ],
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_right_rounded),
          onPressed: () => _onPressed(context, recipe),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              recipe.summary,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }

  _onPressed(BuildContext context, RecipeSummary recipe) {
    context.read<RecipeCubit>().selectRecipe(recipe.recipeId);
    locator
        .get<EvaRouterDelegate>()
        .pushPage(name: '/recipe', arguments: {'recipeName': recipe.title});
  }
}
