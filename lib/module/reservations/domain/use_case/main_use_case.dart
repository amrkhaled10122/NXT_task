import '../../data/repositories/reservation_repository_impl.dart';
import '../../data/sources/reservation_data_provider.dart';
import 'reservation_use_case.dart';

final reversationCase = ReservationUseCase(ReservationRepositoryImpl(ReservationApiDataSource()));
