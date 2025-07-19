import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paxzadmin/app/constants/app_route_constants.dart';
import 'package:paxzadmin/meta/screens/admin/doctoradmin/psychologist_admin_screen.dart';
import 'package:paxzadmin/meta/screens/admin/select_admin_screen.dart';
import 'package:paxzadmin/meta/screens/admin/useradmin/user_admin_screen.dart';
import 'package:paxzadmin/meta/screens/splash/splash_screen.dart';

class MyAppRouteConfig {
  /// The route configuration.
  final GoRouter router = GoRouter(
    initialLocation:
        '/', //! The initial route or screen that the app should load when it starts
    routes: <RouteBase>[
      GoRoute(
        name: MyAppRouteConstants.splashRoute,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.adminselectRouteName,
        path: '/adminselect',
        builder: (BuildContext context, GoRouterState state) {
          return const AdminSelectionScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.useradminRouteName,
        path: '/useradmin',
        builder: (BuildContext context, GoRouterState state) {
          return const UserAdminScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.doctoradminRouteName,
        path: '/doctoradmin',
        builder: (BuildContext context, GoRouterState state) {
          return const PsychologistAdminScreen();
        },
      ),
      // GoRoute(
      //   name: MyAppRouteConstants
      //       .fullScreenimageRouteName, //! Name of the route for identification and navigation purposes
      //   path:
      //       '/fullScreenimage/:imageUrl', //! Route path with a dynamic parameter for imageUrl
      //   builder: (BuildContext context, GoRouterState state) {
      //     return FullScreenImage(
      //       imageUrl: state.pathParameters['imageUrl'],
      //     ); //! Passes the extracted imageUrl from path parameters to the FullScreenImage widget
      //   },
      // ),
    ],
    //  errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}
