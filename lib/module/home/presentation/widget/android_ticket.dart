import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import 'ticket_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WAndroidTicketButton extends StatelessWidget {
  const WAndroidTicketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        builder: (_) => const WTicketSheet(),
        context: context,
        expand: false,
      ),
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
}
