import 'package:cross_platforme_mobile/app/core/data/remote/chat_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/message_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/user_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/chat_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/message_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/chat_messages_controller.dart';

class ChatMessagesBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => ChatDatasource(_dio));
    Get.lazyPut(() => ChatRepository());
    Get.lazyPut(() => UserDataSource(_dio));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => MessageDatasource(_dio));
    Get.lazyPut(() => MessageRepository());
    Get.lazyPut(() => ChatMessagesController());
  }
}
