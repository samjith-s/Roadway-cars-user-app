import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:roadway/domain/chat/chat_model.dart';
import 'package:roadway/domain/chat/chat_services.dart';

@LazySingleton(as: ChatServices)
class ChatServicesImpl extends ChatServices {
  @override
  Future<List<Chat>> getAllChats() async {
    List<Chat> messages = [];
    try {
      CollectionReference msgRef = FirebaseFirestore.instance
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('messages');

      QuerySnapshot<Object?> totalMsgDocs = await msgRef.get();

      if (totalMsgDocs.docs.isNotEmpty) {
        messages = totalMsgDocs.docs.map((message) => Chat.fromJson(message.data() as Map<String, dynamic>)).toList();
        messages.sort(
          (a, b) => b.time.compareTo(a.time),
        );
      }
      return messages;
    } catch (e) {
      log(e.toString());
      return messages;
    }
  }
}
