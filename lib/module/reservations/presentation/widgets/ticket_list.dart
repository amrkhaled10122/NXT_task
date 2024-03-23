import 'package:flutter/material.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../data/models/user_ticket.dart';
import 'reservation_ticket.dart';

class WTicketList extends StatelessWidget {
  final List<UserTicket> userTickets;
  const WTicketList({super.key, required this.userTickets});

  @override
  Widget build(BuildContext context) {
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
}
