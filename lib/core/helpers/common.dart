import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// A helper class for configuring and using EasyLoading.
class EasyLoadingHelpers {
  static void setup(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.displayMedium!;
    final Color primaryColor = theme.primaryColor;

    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.displayDuration = const Duration(seconds: 1);
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.indicatorColor = primaryColor;
    EasyLoading.instance.progressColor = primaryColor;
    EasyLoading.instance.backgroundColor = theme.cardColor;
    EasyLoading.instance.textStyle = textStyle;
    EasyLoading.instance.textColor = primaryColor;
    EasyLoading.instance.dismissOnTap = true;
  }
}

/// A helper class for showing informative toasts.
class InfoHelper {
  static void showToast({
    required String message,
    Color backgroundColor = Colors.red,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );
  }
}
