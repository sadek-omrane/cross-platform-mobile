import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  @override
  bool callGetMe = false;

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
    final res = await userRepository.register(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (token) {
        secureStorageService.setToken(token);
        Get.offAllNamed(Routes.MAIN_WRAPPER);
      },
    );
  }
}
