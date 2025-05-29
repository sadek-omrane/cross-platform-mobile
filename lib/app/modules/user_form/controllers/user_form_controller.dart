import 'dart:io';
import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends BaseController {
  @override
  bool callGetMe = false;
  // repositories
  final _efileRepository = Get.find<EFileRepository>();

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final phoneController = TextEditingController();
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
    final res = await userRepository.me();
    res.fold(
      (err) {
        secureStorageService.removeToken();
        secureStorageService.removeUser();
        Get.offAllNamed(Routes.LOGIN);
      },
      (user) {
        nameController.text = '${user.name ?? ''}';
        bioController.text = '${user.bio ?? ''}';
        phoneController.text = '${user.phone ?? ''}';
        profileImageIdController.text = '${user.profileImageId ?? ''}';
        coverImageIdController.text = '${user.coverImageId ?? ''}';
        emailController.text = '${user.email ?? ''}';
      },
    );
  }

  void save() async {
    if (!formKey.currentState!.validate()) return;
    await uploadEFiles();
    final data = {
      'name': nameController.text,
      'bio': bioController.text,
      'phone': phoneController.text,
      'profile_image_id': profileImageIdController.text.isNotEmpty
          ? int.tryParse(profileImageIdController.text)
          : null,
      'cover_image_id': coverImageIdController.text.isNotEmpty
          ? int.tryParse(coverImageIdController.text)
          : null,
      'email': emailController.text,
    };
    final res = await userRepository.update(me!.id!, data);
    res.fold(
      (err) => ToastFactory.error(err),
      (user) {
        secureStorageService.setUser(user);
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
