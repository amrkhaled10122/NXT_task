import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';
import '../../../reservations/data/models/reservation.dart';
import '../../../reservations/data/models/user_ticket.dart';
import '../../../reservations/presentation/view_model/reservation_view_model.dart';
import '../../../reservations/presentation/widgets/reservation_ticket.dart';
import '../../../reservations/presentation/widgets/sheet_header.dart';

import 'package:provider/provider.dart';

class WTicketSheet extends StatelessWidget {
  const WTicketSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationViewModel>(builder: (context, value, child) {
      if (EasyLoading.isShow) return const SizedBox.shrink();
      Reservation reservation = value.reservations[0];

      return Container(
          height: 1.sh / 2,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: ListView(
              padding: EdgeInsets.zero,
              children: [const SheetHeader(), 40.heightBox, _buildTicketWidget(context, reservation.userTickets)]));
    });
  }

  Widget _buildTicketWidget(BuildContext context, List<UserTicket> userTickets) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${context.localization.tickets}:",
            style: Theme.of(context).primaryTextTheme.titleLarge,
          ),
          userTickets.isNotEmpty
              ? ReservationTicket(
                  userTicket: userTickets[0],
                )
              : Text(context.localization.noDataFound),
        ],
      ),
    );
  }
}
