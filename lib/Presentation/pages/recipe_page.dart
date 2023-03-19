import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_cubit.dart';

import '../../bloc/recipe/recipe_state.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({required this.arguments});

  final Map<String, String> arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['recipeName']!),
      ),
      bottomNavigationBar: EvaBottomNavBar(),
      body: BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
        if (state is RecipeLoaded) {
          return Center(
            child: ListView.builder(itemBuilder: ((context, index) {
              var stepData = List.of(state.data.steps)[index];
              return Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(stepData.title ?? 'Шаг $index'),
                  children: [
                    Text(stepData.content),
                  ],
                ),
              );
            })),
          );
        } else {
          return const Center(
            child: Text('Recipe data not loaded'),
          );
        }
      }),
    );
  }
}
