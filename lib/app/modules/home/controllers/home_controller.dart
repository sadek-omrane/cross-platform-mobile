import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _secureStorageService = Get.find<SercureStorageService>();

  UserModel? get me => _secureStorageService.user;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
