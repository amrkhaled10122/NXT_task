import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/common.dart';
import '../widget/android_ticket.dart';
import '../widget/ios_ticket.dart';
import '../widget/open_reservation.dart';
import '../../../../core/component/theme_switch.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

/// Home screen of the application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // Setup loading indicators
    EasyLoadingHelpers.setup(context);
    super.didChangeDependencies();
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
              // Vertical spacing
              40.heightBox,
              // Theme switcher widget
              const ThemeSwitchWidget(),
              const Spacer(),
              // Button for open reservation
              const WOpenReservationButton(),
              // Button for iOS ticket
              const WIosTicketButton(),
              // Button for Android ticket
              const WAndroidTicketButton(),
            ],
          ),
        ),
      ),
    );
  }
}
