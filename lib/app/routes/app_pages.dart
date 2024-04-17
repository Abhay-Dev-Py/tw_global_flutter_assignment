import 'package:flutter_getx_template/app/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:flutter_getx_template/app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter_getx_template/app/modules/search/bindings/search_bindings.dart';
import 'package:flutter_getx_template/app/modules/search/view/search_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.SEARCH;

  static final routes = [
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBindings(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBindings(),
    ),
  ];
}
