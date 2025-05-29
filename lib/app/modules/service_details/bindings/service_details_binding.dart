import 'package:cross_platforme_mobile/app/core/data/remote/chat_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/favorite_datasource.dart';
import 'package:cross_platforme_mobile/app/core/data/remote/service_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/chat_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/favorite_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/service_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => ServiceDatasource(_dio));
    Get.lazyPut(() => ServiceRepository());
    Get.lazyPut(() => FavoriteDataSource(_dio));
    Get.lazyPut(() => FavoriteRepository());
    Get.lazyPut(() => ChatDatasource(_dio));
    Get.lazyPut(() => ChatRepository());
    Get.lazyPut(() => ServiceDetailsController());
  }
}
