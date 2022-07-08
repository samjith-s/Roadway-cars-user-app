import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadway/domain/user/user_model.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState.initial());

  changeError({required String errorMsg, required bool showError}) {
    emit(state.copyWith(errorMsg: errorMsg, showError: showError));
  }

  changeVerificationId(String id) {
    emit(state.copyWith(verificationId: id));
  }

  addUserDetailsToFirebase(UserModel user) {
    try {
      FirebaseFirestore.instance.collection('users').doc(user.userId).set(
            user.toJson(),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  uploadImg(XFile image) async {
    emit(state.copyWith(isImgUploding: true));
    var reference =
        FirebaseStorage.instance.ref().child('ProfilePics/${image.path}');

    UploadTask uploadTask = reference.putFile(File(image.path));
    String? url;
    try {
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      url = await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
    emit(state.copyWith(
      isImgUploding: false,
      imgUrl: url,
    ));
  }

  
}
