import 'package:cross_platforme_mobile/app/core/repositories/user_repository.dart';
import 'package:cross_platforme_mobile/app/core/services/secure_storage_service.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  // repositories
  final _userRepository = Get.find<UserRepository>();
  //services
  final _secureStorageService = Get.find<SercureStorageService>();

  String initialRoute = Routes.HOME;
  List<String> routes = [
    Routes.HOME,
    Routes.SEARCH,
    Routes.CHATS,
    Routes.PROFILE,
  ];

  @override
  void onInit() {
    super.onInit();
    me();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int currentIndex(String? currentRoute) {
    final index = routes.indexOf(currentRoute ?? routes.first);
    return index == -1 ? 0 : index;
  }

  void me() async {
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
}
