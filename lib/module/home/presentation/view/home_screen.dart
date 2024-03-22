import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/theme_switch.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';
import '../../../reservations/presentation/view/ReservationSheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openReservationSheet() {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 1,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(BuildContext context, ScrollController controller, _) {
    return ReservationSheet(
      scrollController: controller,
    );
  }

  Widget _buildFlutterButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15.h)),
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
        ),
        onPressed: _openReservationSheet,
        child: Text(
          context.localization.openReservation,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }

  Widget _buildIOSButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 10.w,
        ),
        child: Text(
          context.localization.showIOSTicket,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }

  Widget _buildAndroidButton() {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
        child: InkWell(
          child: Text(
            context.localization.showAndroidTicket,
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              40.heightBox,
              const ThemeSwitchWidget(),
              const Spacer(),
              _buildFlutterButton(),
              _buildIOSButton(),
              _buildAndroidButton(),
            ],
          ),
        ),
      ),
    );
  }
}
