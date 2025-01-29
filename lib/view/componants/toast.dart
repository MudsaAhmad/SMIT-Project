import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Message {
  void toast(String message, MaterialColor bgColor, Color white) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: white,
        fontSize: 16.0);
  }
}






