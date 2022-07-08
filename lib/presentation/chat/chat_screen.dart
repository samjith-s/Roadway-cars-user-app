

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:roadway/application/Chat/chat_cubit.dart';
import 'package:roadway/application/user/user_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/chat/chat_model.dart';

class UserChatScreen extends StatefulWidget {
  final String? placeHolderMsg;
  const UserChatScreen({
    Key? key,
    this.placeHolderMsg,
  }) : super(key: key);

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getAllChats();
    _messageController = TextEditingController();
    _messageController.text = widget.placeHolderMsg ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadway'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: ListView.builder(
                    reverse: true,
                    itemBuilder: ((context, index) {
                      Chat chat = state.totalChats[index];
                      return Row(
                        mainAxisAlignment: chat.isAdmin ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onLongPress: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Delete this message?',
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'No',
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: kBlack,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            BlocProvider.of<ChatCubit>(context).deleteChat(message: chat);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Yes',
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 6,
                                    bottom: 20,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6 // index % 2 == 0 ? 6 : 8,
                                      ),
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
                                    minWidth: 120,
                                  ),
                                  decoration: BoxDecoration(
                                    color: chat.isAdmin ? kWhite : const Color.fromARGB(255, 17, 71, 116),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: const Radius.circular(20),
                                      bottomRight: const Radius.circular(20),
                                      topLeft: chat.isAdmin ? const Radius.circular(0) : const Radius.circular(20),
                                      topRight: chat.isAdmin ? const Radius.circular(20) : const Radius.circular(0),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chat.message,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: chat.isAdmin ? kBlack : kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  right: 35,
                                  child: Text(
                                    DateFormat('hh:mm a').format(chat.time.toDate()),
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      color: kGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    itemCount: state.totalChats.length,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type something...',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            if (_messageController.text.isNotEmpty) {
                              final message = Chat(
                                message: _messageController.text.trim(),
                                time: Timestamp.now(),
                                isAdmin: false,
                                userId: state.user!.userId,
                              );
                              BlocProvider.of<ChatCubit>(context).addChat(
                                message: message,
                                userName: state.user!.name,
                                userImage: state.user!.profilePicUrl,
                              );
                              _messageController.text = '';
                            }
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 18, 46, 70),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Align(
                              child: RotationTransition(
                                turns: AlwaysStoppedAnimation(-40 / 360),
                                child: Icon(
                                  Icons.send_rounded,
                                  color: kWhite,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
