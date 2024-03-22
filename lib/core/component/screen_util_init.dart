import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Widget to initialize the screen size configurations using ScreenUtil.
class ScreenInit extends StatelessWidget {
  /// The builder function to build the UI.
  final Widget Function(BuildContext, Widget?) builder;

  /// The design width used for screen adaptation.
  final double designWidth = 375.0;

  /// The design height used for screen adaptation.
  final double designHeight = 812.0;

  /// Constructs a ScreenInit widget.
  ///
  /// [builder]: The builder function to build the UI.
  const ScreenInit({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(designWidth, designHeight),
      useInheritedMediaQuery: true,
      builder: builder,
    );
  }
}
