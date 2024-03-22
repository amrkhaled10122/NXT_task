import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/dashed_line.dart';
import '../../data/models/reservation.dart';
import '../../data/models/Stay.dart';
import '../view_model/reservation_view_model.dart';
import '../widgets/hotel_location.dart';
import '../widgets/hotel_name.dart';
import '../widgets/hotel_rate.dart';
import '../widgets/reservation_date.dart';
import '../widgets/reservation_gallery.dart';
import '../widgets/room_reservation.dart';
import '../widgets/sheet_header.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/models/user_ticket.dart';
import '../widgets/reservation_ticket.dart';

class ReservationSheet extends StatefulWidget {
  final ScrollController scrollController;
  const ReservationSheet({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<ReservationSheet> createState() => _ReservationSheetState();
}

class _ReservationSheetState extends State<ReservationSheet> {
  Widget _buildHeaderImage() {
    return Assets.images.sheetHeader.image(width: 1.sw, fit: BoxFit.fill);
  }

  Widget _buildTickets(List<UserTicket> userTickets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${context.localization.tickets}:",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userTickets.length,
            itemBuilder: (BuildContext context, int index) {
              return ReservationTicket(
                userTicket: userTickets[index],
              );
            })
      ],
    );
  }

  Widget _buildFooter() {
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

  @override
  Widget build(BuildContext context) {
    final verticalPadding = 40.heightBox;

    return Consumer<ReservationViewModel>(builder: (context, value, child) {
      if (EasyLoading.isShow) return const SizedBox.shrink();
      Reservation reservation = value.reservations[0];
      List<Stay> stays = reservation.stays;
      Stay? stay;
      if (stays.isNotEmpty) {
        stay = stays[0];
      }
      return Container(
        height: 0.85.sh,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: ListView(
          controller: widget.scrollController,
          children: [
            const SheetHeader(),
            _buildHeaderImage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
              child: Column(
                children: [
                  HotelName(hotelName: stay?.name ?? ""),
                  verticalPadding,
                  ReservationDate(
                    startDate: reservation.startDate,
                    endDate: reservation.endDate,
                  ),
                  verticalPadding,
                  HotelRate(
                    stars: stay?.stars ?? 0,
                    roomCount: stay?.rooms.length ?? 0,
                  ),
                  verticalPadding,
                  HotelLocation(
                    hotelName: stay?.name ?? '',
                    address: stay?.address ?? '',
                  ),
                  verticalPadding,
                  _buildTickets(reservation.userTickets),
                  verticalPadding,
                  DashedLine(
                    color: Theme.of(context).dividerColor,
                  ),
                  verticalPadding,
                  stay != null && stay.rooms.isNotEmpty
                      ? RoomReservation(
                          room: stay.rooms[0],
                          roomNumber: 1,
                        )
                      : const SizedBox.shrink(),
                  40.heightBox,
                  ReservationGallery(imageURLs: stay?.stayImages ?? []),
                  40.heightBox,
                  _buildFooter(),
                  40.heightBox,
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
