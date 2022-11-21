import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/bloc/blocs/categories_bloc.dart';
import 'package:recipes_book_v2/bloc/cubits/recipes_cubit.dart';
import 'package:recipes_book_v2/bloc/cubits/theme_cubit.dart';
import 'package:recipes_book_v2/pages/recipes_page.dart';
import 'package:recipes_book_v2/pages/start_page.dart';
import 'package:recipes_book_v2/pages/unknown_page.dart';
import 'package:recipes_book_v2/repos/categories_repo.dart';
import 'package:recipes_book_v2/repos/database.dart';
import 'package:recipes_book_v2/services/bottom_navigation_handler.dart';
import 'package:recipes_book_v2/services/navigation_controller.dart';
import 'package:recipes_book_v2/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes_book_v2/widgets/bottom_nav_bar.dart';
import 'app_data.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   await DataBase.init();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  User? user = mAuth.currentUser;
  if (user == null) {
    await mAuth.signInAnonymously().onError((error, stackTrace) => throw Exception("Anonymous sign-in failed"));
  }
  runApp(const App());
}


class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>(create: (context) => CategoriesBloc(repository: CategoriesRepository())),
        BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
        BlocProvider<RecipesCubit>(create: (context) => RecipesCubit()),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(

            title: 'Flutter Demo',
            theme: ThemeProvider().light,
            darkTheme: ThemeProvider().dark,
            themeMode: state.mode,
            home: HomePage(), //StartPage(),
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (context) => HomePage());
            },
          );
        }
      ),
    );
  }

}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavigationController _sectionsNavigationController = NavigationController.sections();
  final BottomNavigationHandler navigationHandler = BottomNavigationHandler();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EvaBottomNavBar(navigatorKey: navigationHandler.navigatorKey),
      body: Navigator(
        key: navigationHandler.navigatorKey,
        onGenerateRoute: _sectionsNavigationController.onGenerateRoute,
        initialRoute: _sectionsNavigationController.initialRoute,
      )
    );
  }

}
