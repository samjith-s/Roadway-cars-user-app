import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roadway/domain/user/user_model.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  getUserDetails() async {
    final auth = FirebaseAuth.instance;
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Object?> usersDocs = await usersCollection.get();

    if (usersDocs.docs.isNotEmpty) {
      var users = usersDocs.docs
          .where((element) => element.id == auth.currentUser!.uid)
          .toList();
      UserModel user =
          UserModel.fromJson(users.first.data() as Map<String, dynamic>);
      emit(state.copyWith(user: user));
    }
  }
}
