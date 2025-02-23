import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/chat_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController
    with StateMixin<ServiceModel> {
  //repositories
  final _serviceRepository = Get.find<ServiceRepository>();
  final _chatRepository = Get.find<ChatRepository>();

  final searchController = TextEditingController();
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
    final res = await _serviceRepository.getById(id!);
    res.fold(
      (err) {
        ToastFactory.error('Service not found !');
        Get.back();
      },
      (service) => change(service, status: RxStatus.success()),
    );
  }

  //create
  void contact() async {
    if (!formKey.currentState!.validate()) return;
    final data = {
      'user_id': state?.createdBy?.id,
      'message_content': messageController.text,
    };
    final res = await _chatRepository.create(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (chat) {
        ToastFactory.success('Message has been sent');
        Get.back();
      },
    );
  }

  void delete() async {
    final res = await _serviceRepository.delete(id!);
    res.fold(
      (err) => ToastFactory.error(err),
      (msg) {
        ToastFactory.success('Service has been deleted');
        Get.back();
      },
    );
  }
}
