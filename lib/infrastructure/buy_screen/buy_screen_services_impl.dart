import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/domain/buy_screen/buy_screen_services.dart';
import 'package:roadway/domain/buy_screen/models/body_types_model.dart';
import 'package:roadway/domain/buy_screen/models/brand_medel.dart';
import 'package:roadway/domain/buy_screen/models/segment_model.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';

@LazySingleton(as: BuyScreenServices)
class BuyScreenServicesImplementation extends BuyScreenServices {
  List<BodyType> _result = [];
  @override
  Future<Either<String, List<BodyType>>> getBodyTypes() async {
    try {
      CollectionReference bodytypes =
          FirebaseFirestore.instance.collection('vehicles').doc('vehiclesbodytypes').collection('bodytypes');
      QuerySnapshot<Object?> bodyTypesList = await bodytypes.get();
      if (bodyTypesList.docs.isNotEmpty) {
        _result = bodyTypesList.docs.map((doc) => BodyType.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return right(_result);
      }
      return left('Unknown error occured..Please try later.');
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Segment>>> getSegments() async {
    List<Segment> result = [];
    try {
      CollectionReference segments =
          FirebaseFirestore.instance.collection('vehicles').doc('vehiclesegments').collection('segments');
      QuerySnapshot<Object?> segmentList = await segments.get();
      if (segmentList.docs.isNotEmpty) {
        result = segmentList.docs.map((doc) => Segment.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return right(result);
      }
      return left('Unknown error occured..Please try later.');
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Brand>>> getAllBrands() async {
    List<Brand> result = [];
    try {
      CollectionReference brands =
          FirebaseFirestore.instance.collection('vehicles').doc('vehiclesbrands').collection('brands');
      QuerySnapshot<Object?> brandscollection = await brands.get();
      if (brandscollection.docs.isNotEmpty) {
        result = brandscollection.docs.map((doc) => Brand.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return right(result);
      }
      return left('Unknown error occured..Please try later.');
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Vehicle>>> getAllVehicle() async {
    List<Vehicle> result = [];
    try {
      CollectionReference vehiclesRef = FirebaseFirestore.instance.collection('vehicles');
      QuerySnapshot<Object?> vehicles = await vehiclesRef.get();
      if (vehicles.docs.isNotEmpty) {
        result = vehicles.docs.map((doc) => Vehicle.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return right(result);
      }
      return left('No data available');
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      log(e.toString());
      return left('Unknown error occured..Please try again later.');
    }
  }
}
