import 'package:flutter/material.dart';
import 'package:store_app/widgets/add_product_bottom_sheet.dart';

FloatingActionButton customFloatingActionButton(
    BuildContext context, String categoryName) {
  return FloatingActionButton(
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
            categoryName: categoryName,
          );
        },
      );
    },
    child: const Icon(
      Icons.add,
    ),
  );
}
