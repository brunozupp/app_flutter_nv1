import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {

  final String label;
  final bool obscureText;
  final void Function(String) onChanged;

  const CustomTextFieldWidget({ 
    Key? key, 
    required this.label, 
    required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label)
      ),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}