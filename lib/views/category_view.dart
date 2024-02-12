import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/add_product_bottom_sheet.dart';
import 'package:store_app/widgets/products_grid_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, this.categoryName}) : super(key: key);
  static const id = 'CategoryView';
  final String? categoryName;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context)
        .getProductsCategory(categoryName: widget.categoryName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          widget.categoryName!,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  List<ProductModel> products = state.products;
                  return ProductsGridView(products: products);
                } else if (state is ProductsFailure) {
                  log(state.errMessage!);
                  return SliverToBoxAdapter(
                    child: customErrorText(),
                  );
                } else {
                  return SliverToBoxAdapter(child: customIndicator());
                }
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddProductBottomSheet(
                categoryName: widget.categoryName!,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
