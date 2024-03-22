import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension to easily create a SizedBox with width.
extension SizeExtensionBox on num {
  /// Creates a SizedBox with the specified width.
  Widget get widthBox => SizedBox(
        width: ScreenUtil().setWidth(this is int ? toDouble() : this),
      );

  /// Creates a SizedBox with the specified height.
  Widget get heightBox => SizedBox(
        height: ScreenUtil().setHeight(this is int ? toDouble() : this),
      );
}
