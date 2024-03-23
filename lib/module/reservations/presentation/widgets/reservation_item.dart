import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/models/reservation.dart';
import '../../data/models/stay.dart';
import 'ticket_list.dart';
import '../../../../core/component/dashed_line.dart';

import '../widgets/hotel_location.dart';
import '../widgets/hotel_name.dart';
import '../widgets/hotel_rate.dart';
import '../widgets/reservation_date.dart';
import '../widgets/reservation_gallery.dart';
import '../widgets/room_reservation.dart';

import '../../../../core/helpers/extension/size_extension_box.dart';

class WReservationItem extends StatelessWidget {
  final Reservation reservation;
  const WReservationItem({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    List<Stay> stays = reservation.stays;
    Stay? stay;
    if (stays.isNotEmpty) {
      stay = stays[0];
    }
    return Column(
      children: [
        _buildHeaderImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
          child: Column(
            children: [
              HotelName(hotelName: stay?.name ?? ""),
              40.heightBox,
              ReservationDate(
                startDate: reservation.startDate,
                endDate: reservation.endDate,
              ),
              40.heightBox,
              HotelRate(
                stars: stay?.stars ?? 0,
                roomCount: stay?.rooms.length ?? 0,
              ),
              40.heightBox,
              HotelLocation(
                hotelName: stay?.name ?? '',
                address: stay?.address ?? '',
              ),
              40.heightBox,
              WTicketList(
                userTickets: reservation.userTickets,
              ),
              40.heightBox,
              DashedLine(
                color: Theme.of(context).dividerColor,
              ),
              40.heightBox,
              stay != null && stay.rooms.isNotEmpty
                  ? RoomReservation(
                      room: stay.rooms[0],
                      roomNumber: 1,
                    )
                  : const SizedBox.shrink(),
              40.heightBox,
              ReservationGallery(imageURLs: stay?.stayImages ?? []),
              40.heightBox,
              _buildFooter(context),
              40.heightBox,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderImage() {
    return Assets.images.sheetHeader.image(width: 1.sw, fit: BoxFit.fill);
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.amenities,
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
        5.heightBox,
        Text(
          context.localization.amenitiesMessage,
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }
}
