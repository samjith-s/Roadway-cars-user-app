import 'package:roadway/domain/chat/chat_model.dart';

abstract class ChatServices {
  Future<List<Chat>> getAllChats();
}
