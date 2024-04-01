import 'package:ecommerce_clean_arch/featrues/products/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: RouteConstants.homePageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        }),
    // GoRoute(
    //     path: '/details/:id',
    //     name: RouteConstants.detailsPageRouteName,
    //     builder: (BuildContext context, GoRouterState state) {
    //       final String id = state.pathParameters['id']!;
    //       return DetailsPage(id: id);
    //     }),
    // GoRoute(
    //     path: '/addorupdatepage',
    //     name: RouteConstants.addPageRouteName,
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const AddPage();
    //     }),
    // GoRoute(
    //     path: '/update/:id',
    //     name: RouteConstants.updatePageRouteName,
    //     builder: (BuildContext context, GoRouterState state) {
    //       final String id = state.pathParameters['id']!;
    //       return UpdatePage(id: id);
    //     }),
  ],
);
