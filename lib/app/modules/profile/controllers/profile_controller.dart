import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController
    with StateMixin<List<ServiceModel>>, GetSingleTickerProviderStateMixin {
  final _serviceRepository = Get.find<ServiceRepository>();

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        if (tabController.index == 0) {
          get();
        } else {
          change(null, status: RxStatus.empty());
        }
      }
    });
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
    final res = await _serviceRepository.get(createdById: me?.id);
    res.fold((err) => ToastFactory.error(err), (services) {
      if (services.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(services, status: RxStatus.success());
      }
    });
  }
}
