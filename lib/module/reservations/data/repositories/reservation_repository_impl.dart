import '../models/reservation.dart';
import '../sources/reservation_data_source.dart';
import '../../domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationDataSource _dataSource;

  ReservationRepositoryImpl(this._dataSource);

  @override
  Future<List<Reservation>> getReservations() async {
    try {
      // Fetch reservations from the data source
      return await _dataSource.fetchReservations();
    } catch (e) {
      // Handle errors appropriately
      print('Error fetching reservations: $e');
      throw e; // Throw the exception to propagate it
    }
  }
}
