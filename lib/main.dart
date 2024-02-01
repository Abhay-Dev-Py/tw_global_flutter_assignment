import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/providers/passcode_provider.dart';
import 'package:flutter_getx_template/app/common/util/initializer.dart';
import 'package:flutter_getx_template/app/data/services/navigation_service.dart';
import 'package:flutter_getx_template/app/localizations/localization_provider.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/controller/admin_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/agent_dashboard/controller/agent_dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/landing/controller/landing_controller.dart';
import 'package:flutter_getx_template/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_getx_template/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'app/modules/widgets/base_widget.dart';

void main() {
  // AgentOnboardingModel model = getOnboardingModel;
  // model.emailAddress = "rajput@gmail.com";
  // model.mobileNumber = "7016131818";
  // model.panDetails.fullName = "Abhay Rajput";
  // model.panDetails.dateOfBirth = "25-01-2000";
  // model.panDetails.panNumber = "FGGPR7614C";
  // setOnboardingModel = model;
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  //   (value) => Initializer.init(() {
      
  //   }),
  // );
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
    return MultiProvider(
      providers: appProviders,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(360, 640),
        builder: (_, __) => GetMaterialApp(
          title: "BC App",
          translations: AppLocalization(),
          locale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          navigatorKey: AppNavigation.navigatorKey,
          // routerConfig: AppPages.goRoutes,
          builder: (_, child) => child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }

  List<SingleChildWidget> get appProviders {
    return [
      ChangeNotifierProvider<AppLandingProvider>(
        create: (context) => AppLandingProvider(),
      ),
      ChangeNotifierProvider<OnboardingProvider>(
        create: (context) => OnboardingProvider(),
      ),
      ChangeNotifierProvider<PasscodeProvider>(
        create: (context) => PasscodeProvider(),
      ),
      ChangeNotifierProvider<SignInProvider>(
        create: (context) => SignInProvider(),
      ),
      ChangeNotifierProvider<AgentDashboardProvider>(
        create: (context) => AgentDashboardProvider(),
      ),
      ChangeNotifierProvider<AdminDashboardProvider>(
        create: (context) => AdminDashboardProvider(),
      ),
    ];
  }
}
