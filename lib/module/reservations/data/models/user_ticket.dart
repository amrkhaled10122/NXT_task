import 'package:flutter_task_nxt/module/reservations/data/models/ticket_user_data.dart';

/// Represents a user's ticket information.
class UserTicket {
  String gate;
  String seat;
  int ticketId;
  String ticketSystemId;
  String ticketTypeName;
  TicketUserData? ticketUserData;

  UserTicket({
    required this.gate,
    required this.seat,
    required this.ticketId,
    required this.ticketSystemId,
    required this.ticketTypeName,
    this.ticketUserData,
  });

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      gate: json['gate'],
      seat: json['seat'],
      ticketId: json['ticket_id'],
      ticketSystemId: json['ticket_system_id'],
      ticketTypeName: json['ticket_type_name'],
      ticketUserData: json['ticket_user_data'] != null ? TicketUserData.fromJson(json['ticket_user_data']) : null,
    );
  }
}
