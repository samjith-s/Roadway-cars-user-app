import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';
part 'favourites_bloc.freezed.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState.initial()) {
    on<AddOrRemoveFromFavourites>((event, emit) {
      // emit(state.copyWith(
      //   isLoading: true,
      //   isError: false,
      // ));
      try {
        if (!state.favouritesIds.contains(event.vehicleId)) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('favourite')
              .doc(event.vehicleId)
              .set({
            'vehicleId': event.vehicleId,
            'time': Timestamp.now(),
          });
        } else {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('favourite')
              .doc(event.vehicleId)
              .delete();
        }
        add(const GetAllFavourites());
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
          isError: true,
          errorMsg: e.message.toString(),
        ));
      } catch (e) {
        emit(state.copyWith(
          isError: true,
          errorMsg: e.toString(),
        ));
      }
    });

    on<GetAllFavourites>((event, emit) async {
      // emit(
      //   state.copyWith(
      //     isLoading: true,
      //     isError: false,
      //   ),
      // );
      try {
        QuerySnapshot<Map<String, dynamic>> favRes = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('favourite')
            .get();

        if (favRes.docs.isNotEmpty) {
          List<String> favVehicleIds = favRes.docs.map((e) => e.data()['vehicleId'].toString()).toList();
          emit(state.copyWith(
            favouritesIds: favVehicleIds,
            isLoading: false,
          ));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
          isError: true,
          errorMsg: e.message.toString(),
        ));
      } catch (e) {
        emit(state.copyWith(
          isError: true,
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
