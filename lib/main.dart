import 'package:flutter/material.dart';
import 'package:store_app/views/category_view.dart';
import 'package:store_app/views/update_product_view.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      routes: {
        HomeView.id: (context) => const HomeView(),
        UpdateProductsView.id: (context) => const UpdateProductsView(),
        CategoryView.id: (context) => const CategoryView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
