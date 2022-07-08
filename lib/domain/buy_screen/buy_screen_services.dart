

import 'package:dartz/dartz.dart';
import 'package:roadway/domain/buy_screen/models/body_types_model.dart';
import 'package:roadway/domain/buy_screen/models/brand_medel.dart';
import 'package:roadway/domain/buy_screen/models/segment_model.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';

abstract class BuyScreenServices {
  Future<Either<String, List<Segment>>> getSegments();
  Future<Either<String, List<BodyType>>> getBodyTypes();
  Future<Either<String, List<Brand>>> getAllBrands();
  Future<Either<String, List<Vehicle>>> getAllVehicle();
}
