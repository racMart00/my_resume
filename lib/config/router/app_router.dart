import "package:go_router/go_router.dart";

import "package:my_resume/presentation/screens/screens.dart";

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [

    //* Redirect '/' --> '/home/0'
    GoRoute(
      path: '/',
      redirect: ( _ , __ ) => '/home/0',
    ),

    //* Rutas padre/hijo
    GoRoute( //* Padre
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse( state.pathParameters['page'] ?? '0' );

        return HomeScreen( pageIndex: pageIndex );
      },
      routes: [

      ]
    ),

  ]
);