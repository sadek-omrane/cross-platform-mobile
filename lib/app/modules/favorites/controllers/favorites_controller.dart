import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/favorite_repository.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritesController extends BaseController
    with StateMixin<List<ServiceModel>> {
  // repositories
  final _favoritesRepository = Get.find<FavoriteRepository>();

  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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
    final res = await _favoritesRepository.get(search: searchController.text);
    res.fold((err) => ToastFactory.error(err), (services) {
      if (services.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(services, status: RxStatus.success());
      }
    });
  }
}
