import 'package:ecommerce_clean_arch/core/routing/route_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductHiveModelAdapter());
  // await Hive.openBox('productBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Internship',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      // routerConfig: router,
    );
  }
}
