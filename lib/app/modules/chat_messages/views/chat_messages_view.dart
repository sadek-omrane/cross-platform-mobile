import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_messages_controller.dart';

class ChatMessagesView extends GetView<ChatMessagesController> {
  const ChatMessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatMessagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatMessagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
