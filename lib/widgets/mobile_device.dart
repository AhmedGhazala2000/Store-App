import 'package:flutter/material.dart';
import 'package:store_app/utils/responsive_font_size.dart';
import 'package:store_app/widgets/category_card.dart';

class MobileDevice extends StatelessWidget {
  const MobileDevice({
    super.key,
    required this.categories,
  });

  final List categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveFontSize(
        context,
        fontSize: 110,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryName: categories[index],
          );
        },
      ),
    );
  }
}
