import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/views/category_view.dart';
import 'package:store_app/views/update_product_view.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(useMaterial3: false),
        routes: {
          HomeView.id: (context) => const HomeView(),
          UpdateProductsView.id: (context) => const UpdateProductsView(),
          CategoryView.id: (context) => const CategoryView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
