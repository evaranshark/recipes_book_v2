import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/cubits/recipes_cubit.dart';
import 'package:recipes_book_v2/bloc/states/recipes_states.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<RecipesCubit, RecipesState>(
            builder: (context, state) {
              if (state is RecipesLoaded) {
                if (state.recipes.isNotEmpty) {
                  return ListView.builder(
                      itemBuilder: (context, index) => Card(
                            child: ListTile(
                                title: Text(state.recipes[index].title)),
                          ));
                } else {
                  return Text("Wow, such empty!");
                }
              }
              if (state is RecipesLoading) {
                return const CircularProgressIndicator();
              }
              if (state is RecipesEmpty) {
                return Container();
              }
              if (state is RecipesLoadFailed) {
                print("Recipes loading failed");
                return const Text("Error");
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
