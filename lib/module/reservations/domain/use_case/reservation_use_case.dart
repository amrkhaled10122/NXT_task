import '../../data/models/reservation.dart';
import '../repositories/reservation_repository.dart';

class ReservationUseCase {
  final ReservationRepository _reservationRepository;

  ReservationUseCase(this._reservationRepository);

  Future<List<Reservation>> getReservations() async {
    try {
      return await _reservationRepository.getReservations();
    } catch (e) {
      // Handle errors appropriately
      print('Error fetching reservations: $e');
      throw e; // Re-throw the error to notify the caller
    }
  }
}
