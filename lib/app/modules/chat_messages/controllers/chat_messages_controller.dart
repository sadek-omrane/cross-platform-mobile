import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/chat_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/chat_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/message_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessagesController extends BaseController with StateMixin<ChatModel> {
  //repositories
  final _chatRepository = Get.find<ChatRepository>();
  final _messageRepository = Get.find<MessageRepository>();

  final messageContentController = TextEditingController();

  int? id;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments?['id'];
    get();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void get() async {
    change(null, status: RxStatus.loading());
    final res = await _chatRepository.getById(id!);
    res.fold(
      (err) => change(null, status: RxStatus.error(err)),
      (chat) => change(chat, status: RxStatus.success()),
    );
  }

  void send() async {
    if (messageContentController.text.isEmpty) return;
    final data = {
      'chat_id': id,
      'content': messageContentController.text,
    };
    final res = await _messageRepository.create(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (message) {
        messageContentController.clear();
        final newState = state!;
        newState.messages!.insert(0, message);
        change(
          newState,
          status: RxStatus.success(),
        );
      },
    );
  }
}
