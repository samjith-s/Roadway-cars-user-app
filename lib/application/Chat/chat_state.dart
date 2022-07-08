part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<Chat> totalChats,
    required bool isLoading,
    required bool isError,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        totalChats: [],
        isLoading: false,
        isError: false,
      );
}
