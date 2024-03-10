import 'package:flutter/material.dart';
import 'package:store_app/widgets/category_card.dart';

class TabletAndDesktopDevice extends StatelessWidget {
  const TabletAndDesktopDevice({
    super.key,
    required this.categories,
  });

  final List categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories
          .map(
            (e) => Expanded(
              child: CategoryCard(categoryName: e),
            ),
          )
          .toList(),
    );
  }
}
