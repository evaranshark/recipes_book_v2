import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book_v2/Presentation/pages/custom_page.dart';
import 'package:recipes_book_v2/Utils/router.dart';
import 'package:recipes_book_v2/bloc/blocs/appstate_bloc.dart';
import 'package:recipes_book_v2/Utils/widgets/responsive.dart';
import 'package:recipes_book_v2/bloc/blocs/categories_bloc.dart';
import 'package:recipes_book_v2/bloc/cubits/recipes_cubit.dart';
import 'package:recipes_book_v2/bloc/cubits/theme_cubit.dart';
import 'package:recipes_book_v2/Presentation/Controllers/bottom_navigation_handler.dart';
import 'package:recipes_book_v2/bloc/recipe/recipe_cubit.dart';
import 'package:recipes_book_v2/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Presentation/pages/start_page.dart';
import 'firebase_options.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'locator.dart';

void main() async {
  await init();
  runApp(const App());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setup();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    //PhoneAuthProvider(),
    GoogleProvider(clientId: 'GOOGLE_CLIENT_ID'),
  ]);
  //User? user = mAuth.currentUser;
  // if (user == null) {
  //   await mAuth.signInAnonymously().onError(
  //       (error, stackTrace) => throw Exception("Anonymous sign-in failed"));
  // }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>(create: (context) => CategoriesBloc()),
        BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
        BlocProvider<RecipesCubit>(create: (context) => RecipesCubit()),
        BlocProvider<AppStateBloc>(create: (context) => AppStateBloc()),
        BlocProvider<RecipeCubit>(create: ((context) => RecipeCubit())),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
          builder: (context, state) {
        return MaterialApp(
          // routerDelegate: locator.get<EvaRouterDelegate>(),
          //backButtonDispatcher: RootBackButtonDispatcher(),
          title: 'Flutter Demo',
          theme: ThemeProvider().light,
          darkTheme: ThemeProvider().dark,
          themeMode: state.mode,
          //home: CustomPage(),
          routes: {
            '/sign-in': (context) {
              return SignInScreen(
                //providers: providers,
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    Navigator.pushReplacementNamed(context, '/page');
                  }),
                ],
              );
            },
            '/page': (context) {
              return CustomPage();
            }
          },
          initialRoute:
              FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/page',
        );
      }),
    );
  }
}
