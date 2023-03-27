import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_book_v2/Domain/Entities/recipe_step.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_cubit.dart';

import '../../bloc/recipe/recipe_state.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({required this.arguments});

  final Map<String, String> arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: arguments['recipeName']!,
          transitionOnUserGestures: true,
          child: Text(arguments['recipeName']!),
        ),
      ),
      endDrawer: const _IngredientsDrawer(),
      onEndDrawerChanged: (isOpened) =>
          context.read<AppStateBloc>().setBlockNavBar(isOpened),
      body: BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
        if (state is RecipeLoaded) {
          var steps = List.of(state.data.steps);
          return Center(
            child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: ((context, index) {
                  var stepData = steps[index];
                  return _RecipeStepCard(stepData: stepData);
                })),
          );
        } else if (state is RecipeLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const Center(
            child: Text('Recipe data not loaded'),
          );
        }
      }),
    );
  }
}

class _RecipeStepCard extends StatelessWidget {
  const _RecipeStepCard({
    Key? key,
    required this.stepData,
  }) : super(key: key);

  final RecipeStep stepData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(stepData.title ?? 'Шаг ${stepData.number}'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                for (var span in stepData.content.toList())
                  Text(
                    span + '\n',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientsDrawer extends StatelessWidget {
  const _IngredientsDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.horizontal(
          start: Radius.circular(20),
        )),
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(
                "Ингредиенты",
                style: GoogleFonts.roboto(fontSize: 26),
              )),
            ),
            const Divider(),
            BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
              if (state is RecipeLoaded) {
                var ingredients = state.data.indgredients.toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(ingredients[index].name),
                              trailing: Text(
                                  '${ingredients[index].amount} ${ingredients[index].units.value}'),
                            ),
                          ),
                        )),
                  ),
                );
              }
              return const SizedBox();
            }),
          ]),
        ),
      ),
    );
  }
}
