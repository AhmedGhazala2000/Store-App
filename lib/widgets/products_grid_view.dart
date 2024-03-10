import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/utils/size_config.dart';
import 'package:store_app/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width < SizeConfig.tablet
            ? 2
            : width < SizeConfig.desktop
                ? 3
                : 4,
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
