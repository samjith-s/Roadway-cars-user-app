import 'package:dartz/dartz.dart';
import 'package:roadway/domain/pre_booking/pre_booking_model.dart';

abstract class PreBookingServices {
  Future<Either<String, List<PreBooking>>> getAllBookingDetails();
}
