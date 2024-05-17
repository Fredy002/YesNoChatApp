// src/screens/chat_screen.dart
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/models/user_model.dart';
import 'package:yes_no_app/src/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/src/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/src/widgets/shared/message_field_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    final userModel = Provider.of<UserModel>(context, listen: false);
    userModel.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: userModel.avatarUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    userModel.avatarUrl,
                  ),
                )
              : const CircleAvatar(
                  child: Icon(Icons.person),
                ),
        ),
        title: Text(
          userModel.name.isNotEmpty ? userModel.name : 'Loading...',
        ),
      ),
      body: const _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  const _chatView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            ),
          ),
          const MessageFieldBox(),
        ],
      ),
    );
  }
}
