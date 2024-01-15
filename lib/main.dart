import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/initializer.dart';
import 'package:flutter_getx_template/app/localizations/localization_provider.dart';
import 'package:flutter_getx_template/app/modules/login/controller/login_controller.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app/modules/home/presentation/controllers/home_controller.dart';
import 'app/modules/widgets/base_widget.dart';


void main() {
  Initializer.init(() {
    runApp(const MyApp());
  });
  InitialBindings().dependencies();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final FlutterLocalization localization = FlutterLocalization.instance;
  // @override
  // void initState() {

  //   localization.init(
  //     mapLocales: [
  //       MapLocale('en', LocalizationProvider.masterLangDataEnglish),
  //       MapLocale('hi', LocalizationProvider.masterLangDataHindi),
  //     ],
  //     initLanguageCode: 'en',
  //   );
  //   localization.translate(LoginTranslations.admin);
  //   localization.onTranslatedLanguage = _onTranslatedLanguage;
  //   super.initState();
  // }

  // void _onTranslatedLanguage(Locale? locale) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<OnboardingProvider>(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider<LocalizationProvider>(
          create: (context) => LocalizationProvider(),
        ),
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context, value, __) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(360, 640),
            builder: (_, __) => GetMaterialApp(
              title: "BC App",
              // supportedLocales: localization.supportedLocales,
              // localizationsDelegates: localization.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              
              // routerConfig: AppPages.goRoutes,
              
              builder: (_, child) => BaseWidget(
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
