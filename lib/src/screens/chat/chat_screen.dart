// ignore_for_file: camel_case_types, avoid_print, unused_field

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/src/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/src/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // the image is deleted each time the flutter command is executed or the application is reopened.
  final int _randomNumber = 1 + (10 * Random().nextDouble()).toInt();

  String _name = '';
  String _avatarUrl = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response =
          await Dio().get('https://reqres.in/api/users/$_randomNumber');
      setState(() {
        _name =
            '${response.data['data']['first_name']} ${response.data['data']['last_name']}';
        _avatarUrl = response.data['data']['avatar'];
      });
    } catch (e) {
      print('Failed to load user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: _avatarUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(_avatarUrl),
                )
              : const CircleAvatar(
                  child: Icon(Icons.person),
                ),
        ),
        title: Text(_name.isNotEmpty ? _name : 'Loading...'),
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
          const Text('data'),
        ],
      ),
    );
  }
}
