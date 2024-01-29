import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

class InfoToast {
  static successToast(BuildContext context, String msg) => CherryToast.success(
      disableToastAnimation: true,
      animationCurve: Curves.ease,
      // width: 32,
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 800),
      title: Text(
        msg,
      )).show(context);

  static errorToast(BuildContext context, String msg,
          {int? durationMilliSeconds}) =>
      CherryToast.error(
          disableToastAnimation: true,
          animationCurve: Curves.ease,
          // width:  32,
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(milliseconds: 800),
          toastDuration: Duration(milliseconds: durationMilliSeconds ?? 3000),
          title: Text(
            msg,
          )).show(context);
}
