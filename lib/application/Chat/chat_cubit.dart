import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/domain/chat/chat_model.dart';
import 'package:roadway/domain/chat/chat_services.dart';
import 'package:roadway/local_notifications_services.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final ChatServices _chatServices;
  ChatCubit(this._chatServices) : super(ChatState.initial());

  Future<void> getAllChats() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    List<Chat> messages = await _chatServices.getAllChats();
    emit(
      state.copyWith(
        totalChats: messages,
        isLoading: false,
      ),
    );
  }

  addChat({required Chat message, required String userName, String? userImage}) async {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(message.userId)
          .collection('messages')
          .add(message.toJson())
          .then((value) => value.update({'msgId': value.id}))
          .onError(
            (error, stackTrace) => print('error while uploading chat'),
          );

      FirebaseFirestore.instance.collection('chats').doc(message.userId).set({
        'lastmessage': message.message,
        'userId': message.userId,
        'time': Timestamp.now(),
        'userName': userName,
        'userImage': userImage,
      });
      DocumentSnapshot<Map<String, dynamic>> userToken =
          await FirebaseFirestore.instance.collection('admin').doc('admin').get();

      LocalNotificationService().sendPushMessage(
        token: userToken.data()!['token'],
        body: message.message,
        title: userName,
        imageUrl: userImage ?? '',
      );

      getAllChats();
    } catch (e) {
      log('errk from chat while addchat');
    }
  }

  deleteChat({required Chat message}) {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(message.userId)
          .collection('messages')
          .doc(message.msgId)
          .delete()
          .onError(
            (error, stackTrace) => print('error while uploading chat'),
          );

      getAllChats();
    } catch (e) {
      log('errk from chat while addchat');
    }
  }
}
