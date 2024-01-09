import 'package:flutter_getx_template/app/modules/home/presentation/views/home_view.dart';
import 'package:flutter_getx_template/app/modules/login/login_binding.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:get/get.dart';
import '../modules/home/presentation/bindings/home_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
