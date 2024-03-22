import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../data/models/reservation.dart';
import '../../domain/use_case/reservation_use_case.dart';

class ReservationViewModel extends ChangeNotifier {
  final ReservationUseCase _reservationUseCase;

  // List to hold reservation data
  List<Reservation> _reservations = [];

  // Constructor
  ReservationViewModel(this._reservationUseCase) {
    fetchReservations();
  }

  // Getter to access reservation data
  List<Reservation> get reservations => _reservations;

  // Method to fetch reservation data
  Future<void> fetchReservations() async {
    await EasyLoading.show();
    try {
      final List<Reservation> fetchedReservations = await _reservationUseCase.getReservations();
      _reservations = fetchedReservations;
      await EasyLoading.dismiss();
      notifyListeners();
    } catch (e) {
      // Handle errors
      print('Error fetching reservations: $e');
    }
  }
}
