import 'dart:io';

import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  // repositories
  final _userRepository = Get.find<UserRepository>();
  final _efileRepository = Get.find<EFileRepository>();
  //services
  final _secureStorageService = Get.find<SercureStorageService>();

  UserModel? get me => _secureStorageService.user;

  final nameController = TextEditingController();
  final profileImageIdController = TextEditingController();
  final coverImageIdController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final profileImageFile = Rx<File?>(null);
  final coverImageFile = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    buildForm();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void buildForm() async {
    final res = await _userRepository.me();
    res.fold(
      (err) {
        _secureStorageService.removeToken();
        _secureStorageService.removeUser();
        Get.offAllNamed(Routes.LOGIN);
      },
      (user) {
        nameController.text = '${user.name}';
        profileImageIdController.text = '${user.profileImageId}';
        coverImageIdController.text = '${user.coverImageId}';
        emailController.text = '${user.email}';
      },
    );
  }

  void save() async {
    if (!formKey.currentState!.validate()) return;
    await uploadEFiles();
    final data = {
      'name': nameController.text,
      'profile_image_id': profileImageIdController.text.isNotEmpty
          ? int.tryParse(profileImageIdController.text)
          : null,
      'cover_image_id': coverImageIdController.text.isNotEmpty
          ? int.tryParse(coverImageIdController.text)
          : null,
      'email': emailController.text,
    };
    final res = await _userRepository.update(me!.id!, data);
    res.fold(
      (err) => ToastFactory.error(err),
      (user) {
        _secureStorageService.setUser(user);
        Get.back(result: true);
      },
    );
  }

  Future<void> uploadEFiles() async {
    if (profileImageFile.value != null) {
      final res = await _efileRepository.upload(profileImageFile.value!);
      res.fold(
        (err) => ToastFactory.error(err),
        (efile) => profileImageIdController.text = '${efile.id}',
      );
    }
    if (coverImageFile.value != null) {
      final response = await _efileRepository.upload(coverImageFile.value!);
      response.fold(
        (err) => ToastFactory.error(err),
        (efile) => coverImageIdController.text = '${efile.id}',
      );
    }
  }
}
