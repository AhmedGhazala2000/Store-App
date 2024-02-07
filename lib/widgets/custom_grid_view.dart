import 'package:flutter/material.dart';
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
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  product: products[index],
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
                  'There was an error, Please try later !',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
