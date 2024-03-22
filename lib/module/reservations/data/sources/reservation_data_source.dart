// reservation_data_source.dart

import 'package:flutter_task_nxt/core/service/network/config/api_endpoints.dart';
import 'package:flutter_task_nxt/core/service/network/config/api_response.dart';
import 'package:flutter_task_nxt/core/service/network/config/dio_base_options.dart';
import 'package:flutter_task_nxt/module/reservations/data/models/reservation.dart';

abstract class ReservationDataSource {
  Future<List<Reservation>> fetchReservations();
}

class ReservationApiDataSource implements ReservationDataSource {
  ReservationApiDataSource();

  @override
  Future<List<Reservation>> fetchReservations() async {
    // Fetch reservations from the API client
    final response = await ApiService.instance.getData(urlPath: ApiEndpoints.userEventsEndpoint);
    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    if (apiResponse.allGood) {
      List<Reservation> reservations =
          (response.data['reservations'] as List<dynamic>).map((data) => Reservation.fromJson(data)).toList();
      return reservations;
    }
    return [];
  }
}
