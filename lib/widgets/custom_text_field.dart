import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.inputType,
    this.onChange,
    this.onSaved,
    this.maxLines,
  });

  final String text;
  final TextInputType? inputType;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: onSaved,
      onChanged: onChange,
      keyboardType: inputType,
      cursorColor: Colors.teal,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: text,
        border: customBorder(color: Colors.grey),
        enabledBorder: customBorder(color: Colors.grey),
        focusedBorder: customBorder(color: Colors.teal),
      ),
    );
  }

  OutlineInputBorder customBorder({required color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
