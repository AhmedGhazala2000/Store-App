import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.inputType,
    this.onChange,
  });

  final String text;
  final TextInputType? inputType;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: text,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
