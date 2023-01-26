import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/Utils/widgets/bottom_nav_bar.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/locator.dart';

import '../../Domain/Entities/category.dart';
import '../../bloc/blocs/categories_bloc.dart';
import '../../bloc/cubits/recipes_cubit.dart';
import '../../bloc/events/categories_events.dart';
import '../../bloc/states/categories_states.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesBloc>(context).add(LoadCategories());
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      bottomNavigationBar: EvaBottomNavBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoadCompleted) {
                List<Category> categories = state.categories;
                return ListView(
                  children: [
                    Card(
                      child: ListTile(
                        minLeadingWidth: 2,
                        leading: Icon(Icons.bookmark_outline_rounded),
                        title: Text("Закладки"),
                        onTap: () => _onBookmarksSelected(context),
                      ),
                    ),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                            key: ValueKey(categories[index].id),
                            title: Text(categories[index].title),
                            onTap: () => _onCategorySelected(
                                context, categories[index].id),
                            leading: Icon(Icons.category_outlined)),
                      ),
                    ),
                  ],
                );
              }
              if (state is CategoriesLoadStarted) {
                return CircularProgressIndicator();
              }
              if (state is CategoriesLoadFailed) {
                return Text("Something went wrong");
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  _onBookmarksSelected(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Bookmarks selected"),
    ));
  }

  void _onCategorySelected(BuildContext context, String id) {
    context.read<RecipesCubit>().loadRecipesByCategory(categoryId: id);
    var router = locator.get<EvaRouterDelegate>();
    router.pushPage(name: '/recipes', arguments: {'categoryId': id});
    context.read<AppStateBloc>().notifyUpdate();
  }
}
