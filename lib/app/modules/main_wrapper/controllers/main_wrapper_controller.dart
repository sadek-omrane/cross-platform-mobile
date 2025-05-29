import 'package:cross_platforme_mobile/app/core/controllers/base_controller.dart';
import 'package:cross_platforme_mobile/app/routes/app_pages.dart';

class MainWrapperController extends BaseController {
  @override
  bool callGetMe = false;

  String initialRoute = Routes.HOME;
  List<String> routes = [
    Routes.HOME,
    Routes.FAVORITES,
    Routes.CHATS,
    Routes.PROFILE,
  ];

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

  int currentIndex(String? currentRoute) {
    final index = routes.indexOf(currentRoute ?? routes.first);
    return index == -1 ? 0 : index;
  }
}
