import 'package:ecommerce_clean_arch/core/routing/route_config.dart';
import 'package:ecommerce_clean_arch/featrues/products/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'dependency_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
        create: (context) => di.sl<ProductBloc>(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Internship',
          theme: ThemeData(
            fontFamily: 'Poppins',
            useMaterial3: true,
          ),
          routerConfig: router,
        ));
  }
}
