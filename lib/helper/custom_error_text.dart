import 'package:flutter/material.dart';

Center customErrorText() {
  return const Center(
      child: Text(
    'There was an error, Please try later !',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ));
}
