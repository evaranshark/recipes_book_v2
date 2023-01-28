import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/bloc/cubits/recipes_cubit.dart';
import 'package:recipes_book_v2/bloc/states/app_state.dart';
import 'package:recipes_book_v2/bloc/states/recipes_states.dart';

import '../../locator.dart';

class RecipesPage extends StatelessWidget {
  RecipesPage({this.arguments});

  Map<String, String>? arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onPop(context),
      child: BlocBuilder<AppStateBloc, AppState>(builder: (context, appState) {
        if (appState.category != null) {
          context
              .read<RecipesCubit>()
              .loadRecipesByCategory(category: appState.category!);
          return Scaffold(
            appBar: AppBar(
              title: Text(appState.category?.title ?? ''),
            ),
            bottomNavigationBar: EvaBottomNavBar(),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: BlocBuilder<RecipesCubit, RecipesState>(
                  builder: (context, recipesState) {
                    if (recipesState is RecipesLoaded) {
                      if (recipesState.recipes.isNotEmpty) {
                        return ListView.builder(
                          itemCount: recipesState.recipes.length,
                          itemBuilder: (context, index) => Card(
                            child: RecipeSummaryTile(
                              title: recipesState.recipes[index].title,
                              summary: recipesState.recipes[index].summary,
                              averageTime:
                                  recipesState.recipes[index].averageTime,
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
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("Category selection fail")),
          );
        }
      }),
    );
  }

  Future<bool> _onPop(BuildContext context) {
    context.read<AppStateBloc>().closeRecipe();
    return Future.value(true);
  }
}

class RecipeSummaryTile extends StatelessWidget {
  final String title;
  final String summary;
  final String averageTime;
  const RecipeSummaryTile({
    Key? key,
    required this.title,
    required this.summary,
    required this.averageTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        title: ListTile(
          title: Text(title),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.access_time_rounded),
              Text(averageTime),
              const Spacer(),
            ],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              summary,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
