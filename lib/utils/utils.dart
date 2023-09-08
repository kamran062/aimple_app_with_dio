import 'dart:ui';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static SnackBar showSnackBar(String? text, Color backgroundColor){
    return SnackBar(
      content: Text(text!,),
      backgroundColor: backgroundColor,
    );
  }

  /// FlushBar
  static flushBarErrorWidget(BuildContext context, String message){
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.elasticInOut,
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }


  /// SnackBar
  static snackBarWidget(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),

    );
  }

  /// Show flutter toast snack bar
  static flutterSuccessToastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }  static flutterErrorToastMessage(String message,){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
    );
  }
}