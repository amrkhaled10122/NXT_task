import 'package:flutter_task_nxt/module/reservations/data/models/reservation.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservations();
}
