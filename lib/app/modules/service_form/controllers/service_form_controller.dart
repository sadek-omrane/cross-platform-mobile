import 'dart:io';
import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/sector_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceFormController extends BaseController
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

  int? id;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments?['id'];
    getSectors();
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
    if (id != null) {
      isLoading.value = true;
      final res = await _serviceRepository.getById(id!);
      res.fold(
        (err) => ToastFactory.error(err),
        (service) {
          nameController.text = '${service.name}';
          descriptionController.text = '${service.description}';
          priceController.text = '${service.price}';
          serviceImageIdController.text = '${service.serviceImageId}';
          sectorIdController.text = '${service.sector?.id}';
        },
      );
      isLoading.value = false;
    }
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

  //update
  void save() async {
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
    final res = await _serviceRepository.update(id!, data);
    res.fold(
      (err) => ToastFactory.error(err),
      (service) {
        ToastFactory.success('Service updated successfully');
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
          id == null ? sectorIdController.text = '${sectors.first.id}' : null;
        }
      },
    );
  }
}
