import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_category_service.dart';
import 'package:store_app/widgets/products_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);
  static const id = 'CategoryView';

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          categoryName,
          style: const TextStyle(
              color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w500),
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
            FutureBuilder<List<ProductModel>>(
                future:
                    CategoryService().getCategory(categoryName: categoryName),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return ProductsGridView(products: products);
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: customErrorText(),
                    );
                  } else {
                    return SliverToBoxAdapter(child: customIndicator());
                  }
                }),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
