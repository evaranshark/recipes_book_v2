import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';

import '../../bloc/recipe/recipe_state.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: ((context, state) {
        Widget? child;
        if (state is RecipeLoaded) {
          child = Scaffold(
            appBar: AppBar(
              title: Text(state.data.title),
            ),
            bottomNavigationBar: EvaBottomNavBar(),
            body: Center(
              child: ListView.builder(itemBuilder: ((context, index) {
                var stepData = state.data.steps[index];
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
            ),
          );
        }
        return child ?? Container();
      }),
    );
  }
}
