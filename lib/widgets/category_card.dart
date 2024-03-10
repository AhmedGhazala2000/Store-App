import 'package:flutter/material.dart';
import 'package:store_app/utils/responsive_font_size.dart';
import 'package:store_app/utils/size_config.dart';
import 'package:store_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(categoryName: categoryName);
            },
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: width < SizeConfig.desktop ? 3 / 2 : 3.5 / 2,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: getResponsiveFontSize(
                  context,
                  fontSize: width < SizeConfig.tablet ? 18 : 22,
                ),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
