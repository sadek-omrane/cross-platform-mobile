import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/sector_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController
    with StateMixin<List<ServiceModel>> {
  // repositories
  final _serviceRepository = Get.find<ServiceRepository>();
  final _sectorRepository = Get.find<SectorRepository>();

  final searchController = TextEditingController();

  final sectorId = Rx<int?>(null);

  final sectors = <SectorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    get();
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

  void get() async {
    change(null, status: RxStatus.loading());
    final res = await _serviceRepository.get(
      search: searchController.text,
      sectorId: sectorId.value,
    );
    res.fold((err) => ToastFactory.error(err), (services) {
      if (services.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(services, status: RxStatus.success());
      }
    });
  }

  void getSectors() async {
    final res = await _sectorRepository.get();
    res.fold(
      (err) => ToastFactory.error(err),
      (data) => sectors.assignAll(data),
    );
  }
}
