import '../misc/constants.dart';
import 'package:flutter/material.dart';

enum SnackBarType { error, succes }

extension BuildExtensionContext on BuildContext {
  void showSnackbar(String message, SnackBarType type) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(this).size.height - 100,
          left: 10,
          right: 10,
        ),
        backgroundColor:
            type == SnackBarType.error ? Colors.red : ThemeColor.green,
      ),
    );
  }
}
