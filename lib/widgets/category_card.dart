import 'package:flutter/material.dart';
import 'package:store_app/views/category_view.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CategoryView(categoryName: categoryName);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        height: 100,
        width: 150,
        alignment: Alignment.center,
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
