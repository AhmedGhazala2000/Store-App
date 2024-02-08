import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 90,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: products.length,
        (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}
