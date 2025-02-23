import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // repositories
  final _userRepository = Get.find<UserRepository>();
  // services
  final _secureStorageService = Get.find<SercureStorageService>();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void register() async {
    if (!formKey.currentState!.validate()) return;
    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    final res = await _userRepository.register(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (token) {
        _secureStorageService.setToken(token);
        Get.offAllNamed(Routes.MAIN_WRAPPER);
      },
    );
  }
}
