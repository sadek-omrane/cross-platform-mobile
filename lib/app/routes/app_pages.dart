import 'package:get/get.dart';

import '../modules/chat_messages/bindings/chat_messages_binding.dart';
import '../modules/chat_messages/views/chat_messages_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_wrapper/bindings/main_wrapper_binding.dart';
import '../modules/main_wrapper/views/main_wrapper_view.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/service_details/bindings/service_details_binding.dart';
import '../modules/service_details/views/service_details_view.dart';
import '../modules/service_form/bindings/service_form_binding.dart';
import '../modules/service_form/views/service_form_view.dart';
import '../modules/user_form/bindings/user_form_binding.dart';
import '../modules/user_form/views/user_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_WRAPPER;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_WRAPPER,
      page: () => const MainWrapperView(),
      binding: MainWrapperBinding(),
      //middlewares: [AuthMiddleware()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.USER_FORM,
      page: () => const UserFormView(),
      binding: UserFormBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHAT_MESSAGES,
      page: () => const ChatMessagesView(),
      binding: ChatMessagesBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_FORM,
      page: () => const ServiceFormView(),
      binding: ServiceFormBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_DETAILS,
      page: () => const ServiceDetailsView(),
      binding: ServiceDetailsBinding(),
    ),
  ];
}
