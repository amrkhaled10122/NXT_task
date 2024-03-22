import 'package:flutter_task_nxt/module/reservations/data/models/Reservation.dart';
import 'package:flutter_task_nxt/module/reservations/data/models/reservation.dart';
import 'package:flutter_task_nxt/module/reservations/data/sources/reservation_data_provider.dart';
import 'package:flutter_task_nxt/module/reservations/domain/repositories/reservation_repository.dart';

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
