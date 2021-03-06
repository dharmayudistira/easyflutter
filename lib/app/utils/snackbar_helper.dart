import 'package:another_flushbar/flushbar.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnackBarHelper {
  static Flushbar showFlushbarSuccess(String title, String message) => Flushbar(
        title: title,
        titleColor: Colors.white,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        margin: EdgeInsets.all(dimenSmall / 2),
        borderRadius: BorderRadius.circular(dimenSmall / 2),
        isDismissible: true,
        duration: Duration(seconds: 3),
        icon: Padding(
          padding: EdgeInsets.only(left: dimenSmall / 2),
          child: FaIcon(
            FontAwesomeIcons.circleCheck,
            color: Colors.green,
          ),
        ),
        leftBarIndicatorColor: Colors.green,
      );

  static Flushbar showFlushbarInfo(String title, String message) => Flushbar(
        title: title,
        titleColor: Colors.white,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        margin: EdgeInsets.all(dimenSmall / 2),
        borderRadius: BorderRadius.circular(dimenSmall / 2),
        isDismissible: true,
        duration: Duration(seconds: 3),
        icon: Padding(
          padding: EdgeInsets.only(left: dimenSmall / 2),
          child: FaIcon(
            FontAwesomeIcons.circleInfo,
            color: Colors.blue,
          ),
        ),
        leftBarIndicatorColor: Colors.blue,
      );

  static Flushbar showFlushbarWarning(String title, String message) => Flushbar(
        title: title,
        titleColor: Colors.white,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        margin: EdgeInsets.all(dimenSmall / 2),
        borderRadius: BorderRadius.circular(dimenSmall / 2),
        isDismissible: true,
        duration: Duration(seconds: 3),
        icon: Padding(
          padding: EdgeInsets.only(left: dimenSmall / 2),
          child: FaIcon(
            FontAwesomeIcons.circleExclamation,
            color: Colors.yellow,
          ),
        ),
        leftBarIndicatorColor: Colors.yellow,
      );

  static Flushbar showFlushbarError(String title, String message) => Flushbar(
        title: title,
        titleColor: Colors.white,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        margin: EdgeInsets.all(dimenSmall / 2),
        borderRadius: BorderRadius.circular(dimenSmall / 2),
        isDismissible: true,
        duration: Duration(seconds: 3),
        icon: Padding(
          padding: EdgeInsets.only(left: dimenSmall / 2),
          child: FaIcon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ),
        ),
        leftBarIndicatorColor: Colors.red,
      );
}
