import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

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
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 80,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: products.length,
                (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: customErrorText(),
            );
          } else {
            return SliverToBoxAdapter(child: customIndicator());
          }
        });
  }
}
