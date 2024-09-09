import '../misc/constants.dart';
import 'package:flutter/material.dart';

class FlixTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obSecureText;
  const FlixTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obSecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obSecureText,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(
          color: ghostWhite,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ghostWhite,
          ),
        ),
      ),
    );
  }
}
