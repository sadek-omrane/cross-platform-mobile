import 'package:cross_platforme_mobile/app/core/data/remote/service_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => ServiceDatasource(_dio));
    Get.lazyPut(() => ServiceRepository());
    Get.lazyPut(() => ProfileController());
  }
}
