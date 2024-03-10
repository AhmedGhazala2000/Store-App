import 'package:flutter/material.dart';
import 'package:store_app/utils/size_config.dart';

IconButton buildIconButton(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  return IconButton(
    padding: const EdgeInsets.only(right: 10),
    onPressed: () {},
    icon: Icon(
      Icons.shopping_cart,
      color: Colors.black,
      size: width < SizeConfig.tablet
          ? 28
          : width < SizeConfig.desktop
              ? 30
              : 32,
    ),
  );
}
