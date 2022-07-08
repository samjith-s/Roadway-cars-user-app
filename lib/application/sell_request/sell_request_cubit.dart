import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roadway/domain/sell_request/sell_request_model.dart';

part 'sell_request_state.dart';
part 'sell_request_cubit.freezed.dart';

class SellRequestCubit extends Cubit<SellRequestState> {
  SellRequestCubit() : super(SellRequestState.initial());

  changePickedDate({required int year}) {
    emit(
      state.copyWith(selectedDate: year),
    );
  }

  sendSellRequest({required SellRequest details}) {
    details.userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      FirebaseFirestore.instance
          .collection('sell_requests')
          .add(details.toJson())
          .then((value) => value.update({'id': value.id}));
    } catch (e) {
      log(e.toString());
    }
  }
}
