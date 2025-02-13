import 'package:cross_platforme_mobile/app/core/data/remote/efile_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/user_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/efile_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/user_form_controller.dart';

class UserFormBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => UserDataSource(_dio));
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => EFileDataSource(_dio));
    Get.lazyPut(() => EFileRepository());
    Get.lazyPut(() => UserFormController());
  }
}
