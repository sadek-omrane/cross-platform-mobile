import 'package:cross_platforme_mobile/app/core/models/service_model.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/service_repository.dart';
import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with StateMixin<List<ServiceModel>> {
  // repositories
  final _userRepository = Get.find<UserRepository>();
  final _serviceRepository = Get.find<ServiceRepository>();
  //services
  final _secureStorageService = Get.find<SercureStorageService>();

  UserModel? get me => _secureStorageService.user;

  @override
  void onInit() {
    super.onInit();
    loadMe();
    getServices();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadMe() async {
    final res = await _userRepository.me();
    res.fold(
      (err) {
        _secureStorageService.removeToken();
        _secureStorageService.removeUser();
        Get.offAllNamed(Routes.LOGIN);
      },
      (user) => _secureStorageService.setUser(user),
    );
  }

  void logout() async {
    final res = await _userRepository.logout();
    res.fold(
      (err) => ToastFactory.error(err),
      (msg) => Get.offAllNamed(Routes.LOGIN),
    );
  }

  void getServices() async {
    change(null, status: RxStatus.loading());
    final res = await _serviceRepository.get();
    res.fold((err) => ToastFactory.error(err), (services) {
      if (services.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(services, status: RxStatus.success());
      }
    });
  }
}
