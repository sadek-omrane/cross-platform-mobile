import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/core/utils/toast_factory.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // repositories
  final userRepository = Get.find<UserRepository>();
  //services
  final secureStorageService = Get.find<SercureStorageService>();

  // current user
  UserModel? get me => secureStorageService.user;

  // this is for loading page content
  RxBool _loadingPage = false.obs;
  bool get loadingPage => _loadingPage.value;
  set loadingPage(bool value) => _loadingPage.value = value;

  // this is for loading action
  RxnString _loadingAction = RxnString(null);
  String? get loadingAction => _loadingAction.value;
  set loadingAction(String? value) => _loadingAction.value = value;

  bool callGetMe = true;
  bool redirect = true;

  @override
  void onInit() {
    super.onInit();
    if (callGetMe) {
      getMe();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMe() async {
    final res = await userRepository.me();
    res.fold(
      (err) {
        secureStorageService.removeToken();
        secureStorageService.removeUser();
        if (redirect) Get.offAllNamed(Routes.LOGIN);
      },
      (user) => secureStorageService.setUser(user),
    );
  }

  void logout() async {
    final res = await userRepository.logout();
    res.fold(
      (err) => ToastFactory.error(err),
      (msg) => Get.offAllNamed(Routes.LOGIN),
    );
  }
}
