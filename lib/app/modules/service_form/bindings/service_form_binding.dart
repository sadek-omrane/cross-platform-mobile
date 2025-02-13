import 'package:cross_platforme_mobile/app/core/data/remote/efile_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/sector_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/service_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/sector_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/service_form_controller.dart';

class ServiceFormBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => ServiceDatasource(_dio));
    Get.lazyPut(() => ServiceRepository());
    Get.lazyPut(() => SectorDataSource(_dio));
    Get.lazyPut(() => SectorRepository());
    Get.lazyPut(() => EFileDataSource(_dio));
    Get.lazyPut(() => EFileRepository());
    Get.lazyPut(() => ServiceFormController());
  }
}
