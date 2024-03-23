import 'package:flutter/material.dart';

import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

class HotelName extends StatelessWidget {
  final String hotelName;
  const HotelName({super.key, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.hotelCheckIn,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        Text(
          "$hotelName  ${context.localization.hotel}",
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }
}
