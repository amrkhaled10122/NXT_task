import '../../data/models/reservation.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservations();
}
