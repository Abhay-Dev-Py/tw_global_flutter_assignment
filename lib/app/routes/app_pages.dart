import 'package:flutter_getx_template/app/data/services/navigation_service.dart';
import 'package:flutter_getx_template/app/modules/admin_dashboard/view/admin_dashboard_view.dart';
import 'package:flutter_getx_template/app/modules/agent_dashboard/view/agent_dashboard_view.dart';
import 'package:flutter_getx_template/app/modules/landing/view/app_landing_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_confirm_passcode_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_email_address_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_enable_biometric_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_iibf_certificate_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_location_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_mobile_number_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_pan_details_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_review_details_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_schedule_offline_verification_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_set_passcode_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_shop_details.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_success_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_verify_email_otp_view.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_verify_mobile_otp_view.dart';
import 'package:flutter_getx_template/app/modules/sign_in/view/sign_in_mobile_number_view.dart';
import 'package:flutter_getx_template/app/modules/sign_in/view/sign_in_passcode_verify_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.ONBOARDING_MOBILE_NUMBER;

  static final routes = [
    GetPage(
      name: _Paths.LANDING,
      page: () => const AppLandingView(),
    ),
    // Onboarding pages
    GetPage(
      name: _Paths.ONBOARDING_LOCATION,
      page: () => const OnboardingLocationView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_MOBILE_NUMBER,
      page: () => const OnboardingMobileNumberView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_VERIFY_MOBILE_OTP,
      page: () => const OnboardingVerifyMobileOtpView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_EMAIL_ADDRESS,
      page: () => const OnboardingEmailAddressView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_VERIFY_EMAIL_OTP,
      page: () => const OnboardingVerifyEmailOtpView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SET_PASSCODE,
      page: () => const OnboardingSetPasscodeView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_CONFIRM_PASSCODE,
      page: () => const OnboardingConfirmPasscodeView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_ENABLE_BIOMETRIC,
      page: () => const OnboardingEnableBiometricView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_PAN_DETAILS,
      page: () => const OnboardingPanDetailsView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SHOP_DETAILS,
      page: () => const OnboardingShopDetailsView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_CERTIFICATE_DETAILS,
      page: () => const OnboardingIIBFCertificateDetailsView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_REVIEW_DETAILS,
      page: () => const OnboardingReviewDetailsView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION,
      page: () => const OnboardingScheduleOfflineVerificationView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SUCCESS,
      page: () => const OnboardingSuccessView(),
    ),
    // Agent views
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
    ),
    GetPage(
      name: _Paths.AGENT_DASHBOARD,
      page: () => const AgentDashboardView(),
    ),
    // Sign in views
    GetPage(
      name: _Paths.SIGN_IN_MOBILE,
      page: () => const SignInMobileNumberView(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_MOBILE,
      page: () => const SignInMobileNumberView(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_PASSCODE_VERIFY,
      page: () => const SignInPasscodeVerifyView(),
    ),
  ];

  static final goRoutes = GoRouter(
    navigatorKey: AppNavigation.navigatorKey,
    initialLocation: INITIAL,
    routes: [
      GoRoute(
        path: _Paths.LANDING,
        builder: (context, state) => const AppLandingView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_LOCATION,
        name: _Paths.ONBOARDING_LOCATION,
        builder: (context, state) => const OnboardingLocationView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_MOBILE_NUMBER,
        name: _Paths.ONBOARDING_MOBILE_NUMBER,
        builder: (context, state) => const OnboardingMobileNumberView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_VERIFY_MOBILE_OTP,
        name: _Paths.ONBOARDING_VERIFY_MOBILE_OTP,
        builder: (context, state) => const OnboardingVerifyMobileOtpView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_EMAIL_ADDRESS,
        name: _Paths.ONBOARDING_EMAIL_ADDRESS,
        builder: (context, state) => const OnboardingEmailAddressView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_VERIFY_EMAIL_OTP,
        name: _Paths.ONBOARDING_VERIFY_EMAIL_OTP,
        builder: (context, state) => const OnboardingVerifyEmailOtpView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_SET_PASSCODE,
        name: _Paths.ONBOARDING_SET_PASSCODE,
        builder: (context, state) => const OnboardingSetPasscodeView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_CONFIRM_PASSCODE,
        name: _Paths.ONBOARDING_CONFIRM_PASSCODE,
        builder: (context, state) => const OnboardingConfirmPasscodeView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_ENABLE_BIOMETRIC,
        name: _Paths.ONBOARDING_ENABLE_BIOMETRIC,
        builder: (context, state) => const OnboardingEnableBiometricView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_PAN_DETAILS,
        name: _Paths.ONBOARDING_PAN_DETAILS,
        builder: (context, state) => const OnboardingPanDetailsView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_SHOP_DETAILS,
        name: _Paths.ONBOARDING_SHOP_DETAILS,
        builder: (context, state) => const OnboardingShopDetailsView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_CERTIFICATE_DETAILS,
        name: _Paths.ONBOARDING_CERTIFICATE_DETAILS,
        builder: (context, state) =>
            const OnboardingIIBFCertificateDetailsView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_REVIEW_DETAILS,
        name: _Paths.ONBOARDING_REVIEW_DETAILS,
        builder: (context, state) => const OnboardingReviewDetailsView(),
      ),
      GoRoute(
        path: _Paths.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION,
        name: _Paths.ONBOARDING_SCHEDULE_OFFLINE_VERIFICATION,
        builder: (context, state) =>
            const OnboardingScheduleOfflineVerificationView(),
      ),
    ],
  );
}
