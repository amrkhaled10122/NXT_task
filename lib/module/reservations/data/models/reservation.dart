import 'stay.dart';
import 'user_ticket.dart';

class Reservation {
  String endDate;
  int id;
  String startDate;
  List<Stay> stays;
  List<UserTicket> userTickets;

  Reservation({
    required this.endDate,
    required this.id,
    required this.startDate,
    required this.stays,
    required this.userTickets,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      endDate: json['end_date'],
      id: json['id'],
      startDate: json['start_date'],
      stays: json['stays'] != null ? (json['stays'] as List).map((i) => Stay.fromJson(i)).toList() : [],
      userTickets: json['user_tickets'] != null
          ? (json['user_tickets'] as List).map((i) => UserTicket.fromJson(i)).toList()
          : [],
    );
  }
}
