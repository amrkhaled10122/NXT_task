import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/theme/theme_provider.dart';
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
        width: 24.w,
        height: 24.w,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      10.widthBox,
      Text(
        context.localization.theme,
        style: Theme.of(context).primaryTextTheme.titleMedium,
      )
    ],
  );
}

/// Builds the toggle button section of the theme switch widget.
Widget _buildToggleButtonWidget(BuildContext context) {
  return InkWell(
    onTap: () => context.read<ThemeProvider>().toggleTheme(),
    child: Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            context.watch<ThemeProvider>().darkTheme ? Assets.icons.lightOff2x.path : Assets.icons.moon2x.path,
            width: 24.w,
            height: 24.w,
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
