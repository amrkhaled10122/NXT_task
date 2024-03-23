import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../reservations/presentation/view/reservation_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WOpenReservationButton extends StatelessWidget {
  const WOpenReservationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15.h)),
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        onPressed: () => showMaterialModalBottomSheet(
          context: context,
          expand: true,
          builder: (BuildContext context) => const ReservationSheet(),
        ),
        child: Text(
          context.localization.openReservation,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
