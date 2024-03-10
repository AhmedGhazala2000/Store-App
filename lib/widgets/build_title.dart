import 'package:flutter/material.dart';
import 'package:store_app/utils/size_config.dart';

Text buildTitle(
  BuildContext context, {
  required String text,
  FontWeight? fontWeight,
  Color? color,
}) {
  double width = MediaQuery.sizeOf(context).width;
  return Text(
    text,
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: width < SizeConfig.tablet
          ? 24
          : width < SizeConfig.desktop
              ? 26
              : 28,
      fontWeight: fontWeight ?? FontWeight.w600,
    ),
  );
}
