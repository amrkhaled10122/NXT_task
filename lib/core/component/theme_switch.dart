import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../module/home/presentation/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import '../helpers/extension/context_extension.dart';
import '../helpers/extension/size_extension_box.dart';

/// Widget for toggling between light and dark themes.
class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

/// Builds the main body of the theme switch widget.
Widget _buildBody(BuildContext context) {
  return Row(
    children: [
      _buildTitleWidget(context),
      const Spacer(),
      _buildToggleButtonWidget(context),
    ],
  );
}

/// Builds the title section of the theme switch widget.
Widget _buildTitleWidget(BuildContext context) {
  return Row(
    children: [
      Image.asset(
        Assets.icons.themeIcon.path,
        width: 26.w,
        height: 26.w,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      10.widthBox,
      Text(
        context.localization.theme,
        style: Theme.of(context).textTheme.titleMedium,
      )
    ],
  );
}

/// Builds the toggle button section of the theme switch widget.
Widget _buildToggleButtonWidget(BuildContext context) {
  return InkWell(
    onTap: () async => await context.read<ThemeProvider>().toggleTheme(),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          color: context.theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25.r),
          ),
          border: Border.all(color: context.theme.primaryColorDark, width: 2)),
      child: Row(
        children: [
          Image.asset(
            context.watch<ThemeProvider>().darkTheme ? Assets.icons.lightOff2x.path : Assets.icons.moon2x.path,
            width: 23.w,
            height: 23.w,
          ),
          14.widthBox,
          Image.asset(
            !context.watch<ThemeProvider>().darkTheme ? Assets.icons.lightOn2x.path : Assets.icons.sun2x.path,
            width: 24.w,
            height: 24.w,
          ),
        ],
      ),
    ),
  );
}
