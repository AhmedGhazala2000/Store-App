import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FutureBuilder(
        future: AllCategoriesService().getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> categories = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Category(
                  categoryName: categories[index],
                );
              },
            );
          } else if (snapshot.hasError) {
            return customErrorText();
          } else {
            return customIndicator();
          }
        },
      ),
    );
  }
}
