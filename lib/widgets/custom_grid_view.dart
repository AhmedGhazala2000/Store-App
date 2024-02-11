import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/products_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return ProductsGridView(products: products);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  customErrorText(),
                ],
              ),
            );
          } else {
            return SliverToBoxAdapter(
                child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                customIndicator(),
              ],
            ));
          }
        });
  }
}
