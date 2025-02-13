import 'dart:io';
import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/sector_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceFormController extends GetxController
    with StateMixin<List<SectorModel>> {
  //repositories
  final _serviceRepository = Get.find<ServiceRepository>();
  final _sectorRepository = Get.find<SectorRepository>();
  final _efileRepository = Get.find<EFileRepository>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final serviceImageIdController = TextEditingController();
  final sectorIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final serviceImageFile = Rx<File?>(null);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSectors();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void create() async {
    if (!formKey.currentState!.validate()) return;
    await uploadEFiles();
    final data = {
      'name': nameController.text,
      'description': descriptionController.text,
      'price': priceController.text,
      'service_image_id': serviceImageIdController.text.isNotEmpty
          ? int.tryParse(serviceImageIdController.text)
          : null,
      'sector_id': int.tryParse(sectorIdController.text),
    };
    final res = await _serviceRepository.create(data);
    res.fold(
      (err) => ToastFactory.error(err),
      (service) {
        ToastFactory.success('Service created successfully');
        Get.back(result: true);
      },
    );
  }

  Future<void> uploadEFiles() async {
    if (serviceImageFile.value != null) {
      final res = await _efileRepository.upload(serviceImageFile.value!);
      res.fold(
        (err) => ToastFactory.error(err),
        (efile) => serviceImageIdController.text = '${efile.id}',
      );
    }
  }

  void getSectors() async {
    change(null, status: RxStatus.loading());
    final res = await _sectorRepository.get();
    res.fold(
      (err) => change(null, status: RxStatus.error(err)),
      (sectors) {
        if (sectors.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(
            sectors,
            status: RxStatus.success(),
          );
        }
      },
    );
  }
}
