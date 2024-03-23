import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import 'ticket_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WIosTicketButton extends StatelessWidget {
  const WIosTicketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCupertinoModalBottomSheet(
        builder: (_) => const WTicketSheet(),
        context: context,
        expand: false,
      ),
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
}
