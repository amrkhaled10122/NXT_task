import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

class ReservationDate extends StatelessWidget {
  final String startDate;
  final String endDate;
  const ReservationDate({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.from,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                dateFormat.format(DateTime.parse(startDate)),
                style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.till,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                dateFormat.format(DateTime.parse(endDate)),
                style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
