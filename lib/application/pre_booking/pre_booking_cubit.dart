import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/core/toast.dart';
import 'package:roadway/domain/pre_booking/pre_booking_model.dart';
import 'package:roadway/domain/pre_booking/pre_booking_services.dart';

part 'pre_booking_state.dart';
part 'pre_booking_cubit.freezed.dart';

@injectable
class PreBookingCubit extends Cubit<PreBookingState> {
  final PreBookingServices _preBookingServices;
  PreBookingCubit(this._preBookingServices) : super(PreBookingState.inital());

  Future<void> addNewBooking({required PreBooking booking}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      booking.userId = userId;
      FirebaseFirestore.instance.collection('pre_bookings').add(booking.toJson()).then(
            (value) => value.update({'id': value.id}),
          );
      Timer(
        const Duration(seconds: 1),
        (() => showToast(
              msg: 'Booking successfuly completed',
            )),
      );
    } on FirebaseException catch (e) {
      state.copyWith(
        isError: true,
        isLoading: false,
        errorText: e.message.toString(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: 'Unknown error occured while fetching data!. please try again',
        ),
      );
    }
    getAllBookingDetails();
  }

  Future<void> getAllBookingDetails() async {
    emit(state.copyWith(
      isError: false,
      isLoading: true,
      errorText: '',
    ));
    final result = await _preBookingServices.getAllBookingDetails();

    result.fold(
      (error) => emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: error,
        ),
      ),
      (bookings) => emit(
        state.copyWith(
          totalBookings: bookings,
          isError: false,
          isLoading: false,
          errorText: '',
        ),
      ),
    );
  }

  Future<void> updateBookingDetails({required PreBooking booking, required String id}) async {
    try {
      FirebaseFirestore.instance.collection('pre_bookings').doc(id).update(
            booking.toJson(),
          );
      Timer(
        const Duration(seconds: 1),
        (() => showToast(
              msg: 'Deatils updated successfuly',
            )),
      );
    } on FirebaseException catch (e) {
      state.copyWith(
        isError: true,
        isLoading: false,
        errorText: e.message.toString(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: 'Unknown error occured while fetching data!. please try again',
        ),
      );
    }

    getAllBookingDetails();
  }

  Future<void> cancelBooking({required String id}) async {
    try {
      FirebaseFirestore.instance.collection('pre_bookings').doc(id).delete();
      Timer(
        const Duration(seconds: 1),
        (() => showToast(
              msg: 'Booking cancel successful',
            )),
      );
    } on FirebaseException catch (e) {
      state.copyWith(
        isError: true,
        isLoading: false,
        errorText: e.message.toString(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: 'Unknown error occured while fetching data!. please try again',
        ),
      );
    }
    getAllBookingDetails();
  }
}
