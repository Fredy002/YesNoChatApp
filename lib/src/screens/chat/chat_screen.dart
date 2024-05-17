// src/screens/chat_screen.dart
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/src/providers/chat_provider.dart';
import 'package:yes_no_app/src/providers/user_provider.dart';
import 'package:yes_no_app/src/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/src/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/src/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: userProvider.avatarUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    userProvider.avatarUrl,
                  ),
                )
              : const CircleAvatar(
                  child: Icon(Icons.person),
                ),
        ),
        title: Text(
          userProvider.name.isNotEmpty ? userProvider.name : 'Loading...',
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
    final chatProvider = context.watch<ChatProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];

                return (message.fromWho == FromWho.her)
                    ? const HerMessageBubble()
                    : MyMessageBubble(message: message);
              },
            ),
          ),
          const MessageFieldBox(),
        ],
      ),
    );
  }
}
