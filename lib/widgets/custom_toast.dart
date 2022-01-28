import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void successToast({required String message, int duration = 3}) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.green,
    );
  }

  static void errorToast({required String message, int duration = 4}) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.red,
    );
  }

  static void showSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final SnackBar snackBar =
        SnackBar(content: Text(text), backgroundColor: Colors.black);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}