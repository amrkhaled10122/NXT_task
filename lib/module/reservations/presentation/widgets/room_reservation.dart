import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/guest.dart';
import '../../data/models/room.dart';

import '../../../../core/component/dashed_line.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

class RoomReservation extends StatelessWidget {
  final Room room;
  final int roomNumber;
  const RoomReservation({super.key, required this.room, required this.roomNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${context.localization.roomReservation} 0$roomNumber",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        35.heightBox,
        Text(
          "${context.localization.guest}:",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: room.guests.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildGuestCardWidget(context: context, guest: room.guests[index]);
          },
        ),
        35.heightBox,
        Text(
          context.localization.roomType,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        5.heightBox,
        Text(
          room.roomTypeName,
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
        35.heightBox,
        _buildRoomNumberWidget(context),
        40.heightBox,
        DashedLine(
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }

  Widget _buildGuestCardWidget({
    required BuildContext context,
    required Guest guest,
  }) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: guest.avatar,
            width: 30.w,
            height: 30.h,
            fit: BoxFit.cover,
          ),
        ),
        6.widthBox,
        Text(
          "${guest.firstName} ${guest.lastName}",
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }

  Widget _buildRoomNumberWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                context.localization.roomNumber,
                maxLines: 1,
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
              5.heightBox,
              Text(
                room.roomNumber,
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
                context.localization.sleeps,
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
              5.heightBox,
              Text(
                room.roomCapacity.toString(),
                style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
