import 'package:cross_platforme_mobile/app/core/data/remote/favorite_datasource.dart';
import 'package:cross_platforme_mobile/app/core/repositories/favorite_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dio = Get.find<Dio>();
    Get.lazyPut(() => FavoriteDataSource(_dio));
    Get.lazyPut(() => FavoriteRepository());
    Get.lazyPut(() => FavoritesController());
  }
}
