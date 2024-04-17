import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/common/util/initializer.dart';
import 'package:flutter_getx_template/app/data/services/navigation_service.dart';

import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  InitialBindings().dependencies();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 640),
      builder: (_, __) => GetMaterialApp(
        title: "BC App",
        locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: AppPages.INITIAL,
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 700),
        getPages: AppPages.routes,
        navigatorKey: AppNavigation.navigatorKey,
        builder: (_, child) => child ?? const SizedBox.shrink(),
      ),
    );
  }
}
