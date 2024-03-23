import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../widgets/reservation_item.dart';
import '../../data/models/reservation.dart';
import '../view_model/reservation_view_model.dart';
import '../widgets/sheet_header.dart';
import 'package:provider/provider.dart';

class ReservationSheet extends StatefulWidget {
  const ReservationSheet({
    super.key,
  });

  @override
  State<ReservationSheet> createState() => _ReservationSheetState();
}

class _ReservationSheetState extends State<ReservationSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationViewModel>(builder: (context, value, child) {
      if (EasyLoading.isShow) return const SizedBox.shrink();
      Reservation reservation = value.reservations[0];

      return ListView(
        children: [
          const SheetHeader(),
          WReservationItem(
            reservation: reservation,
          )
        ],
      );
    });
  }
}
