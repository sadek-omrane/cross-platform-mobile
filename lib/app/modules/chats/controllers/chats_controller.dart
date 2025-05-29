import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/chat_model.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/chat_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsController extends BaseController with StateMixin<List<ChatModel>> {
  //repositories
  final _chatRepository = Get.find<ChatRepository>();

  final searchController = TextEditingController();
  final messageController = TextEditingController();

  final users = <UserModel>[].obs;

  final selectedUser = Rx<UserModel?>(null);

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
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

  //get
  void get() async {
    change(null, status: RxStatus.loading());
    final res = await _chatRepository.get();
    res.fold(
      (err) => change(null, status: RxStatus.error(err)),
      (chats) {
        if (chats.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(chats, status: RxStatus.success());
        }
      },
    );
  }

  //search
  void search() async {
    final res = await userRepository.get(search: searchController.text);
    res.fold(
      (err) => ToastFactory.error(err),
      (users) => this.users.assignAll(users),
    );
  }

  //create
  void create() async {
    if (!formKey.currentState!.validate()) return;
    final data = {
      'user_id': selectedUser.value!.id,
      'message_content': messageController.text,
    };
    final res = await _chatRepository.create(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (chat) {
        get();
        Get.back();
      },
    );
  }

  //delete
  void delete(int id) async {
    final res = await _chatRepository.delete(id);
    res.fold(
      (err) => ToastFactory.error(err),
      (chat) => get(),
    );
  }
}
