import 'package:flutter/material.dart';
import 'package:store_app/utils/size_config.dart';

Center customErrorText(BuildContext context, {String? text}) {
  double width = MediaQuery.sizeOf(context).width;
  return Center(
    child: Text(
      text ?? 'There was an error, Please try later !',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: width < SizeConfig.tablet
            ? 18
            : width < SizeConfig.desktop
                ? 22
                : 24,
      ),
    ),
  );
}
