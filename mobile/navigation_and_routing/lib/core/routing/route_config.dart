import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mihretab/models/shoe_model.dart';
import '../../pages/pages.dart';
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
    GoRoute(
        path: '/details/:shoe',
        name: RouteConstants.detailsPageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          final String? shoe = state.pathParameters['shoe'];

          final ShoeModel myShoe = ShoeModel.getShoe(shoe);
          return DetailsPage(shoe: myShoe);
        }),
    GoRoute(
        path: '/addorupdatepage',
        name: RouteConstants.addPageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const AddPage();
        }),
    GoRoute(
        path: '/update/:shoe',
        name: RouteConstants.updatePageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          final String? shoe = state.pathParameters['shoe'];

          final ShoeModel myShoe = ShoeModel.getShoe(shoe);
          return UpdatePage(shoe: myShoe);
        }),
  ],
);
