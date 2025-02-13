import 'package:get/get.dart';

import '../controllers/chat_messages_controller.dart';

class ChatMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatMessagesController>(
      () => ChatMessagesController(),
    );
  }
}
