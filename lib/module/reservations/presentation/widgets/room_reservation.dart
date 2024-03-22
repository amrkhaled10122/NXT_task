import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/dashed_line.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';
import '../../data/models/Guest.dart';
import '../../data/models/room.dart';

class RoomReservation extends StatelessWidget {
  final Room room;
  final int roomNumber;
  const RoomReservation({Key? key, required this.room, required this.roomNumber}) : super(key: key);

  Widget _buildGuestCard({
    required BuildContext context,
    required Guest gust,
  }) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: gust.avatar,
            width: 30.w,
            height: 30.h,
            fit: BoxFit.cover,
          ),
        ),
        6.widthBox,
        Text(
          "${gust.firstName} ${gust.lastName}",
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }

  Widget _buildRoomNumber(BuildContext context) {
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
            return _buildGuestCard(context: context, gust: room.guests[index]);
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
        _buildRoomNumber(context),
        40.heightBox,
        DashedLine(
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }
}
