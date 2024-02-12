import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.teal),
      ),
      minWidth: double.infinity,
      height: 50,
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(.7),
              ))
          : Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
    );
  }
}
