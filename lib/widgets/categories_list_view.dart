import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_error_text.dart';
import 'package:store_app/helper/custom_indicator.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/utils/size_config.dart';
import 'package:store_app/widgets/mobile_device.dart';
import 'package:store_app/widgets/tablet_and_desktop_device.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return FutureBuilder(
      future: AllCategoriesService().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> categories = snapshot.data!;
          return width < SizeConfig.tablet
              ? MobileDevice(categories: categories)
              : TabletAndDesktopDevice(
                  categories: categories,
                );
        } else if (snapshot.hasError) {
          return customErrorText(context,
              text: "Failed while loading categories");
        } else {
          return customIndicator();
        }
      },
    );
  }
}
