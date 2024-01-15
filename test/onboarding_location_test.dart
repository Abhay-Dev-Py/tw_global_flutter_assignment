import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/onboarding/views/onboarding_location_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingLocationView Widget Tests', () {
    testWidgets('UI Elements Test', (WidgetTester tester) async {
      // Build the widget
      await tester
          .pumpWidget(const MaterialApp(home: OnboardingLocationView()));

      // Test background color
      // expect(find.byType(Scaffold), findsOneWidget);
      // expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
      //     equals(AppColors.kPrimaryColor));

      // Test text elements
      // expect(find.text("Welcome to Appreciate!"), findsOneWidget);
      // expect(find.text("Location"), findsOneWidget);
      // expect(
      //     find.text(
      //         "We access your location during signup to prevent suspicious account activity"),
      //     findsOneWidget);

      // Test icon and image loading
      // expect(find.byIcon(Icons.location_pin), findsOneWidget);
      // expect(find.byType(Image), findsOneWidget);

      // Test button
      expect(find.text("allow permissions"), findsOneWidget);
    });

    // testWidgets('Button Click Test', (WidgetTester tester) async {
    //   // Build the widget
    //   await tester
    //       .pumpWidget(const MaterialApp(home: OnboardingLocationView()));

    //   // Tap the button
    //   await tester.tap(find.text("allow permissions"));
    //   await tester.pumpAndSettle();

    //   // Verify the navigation
    //   // expect(Provider.of<OnboardingProvider>(tester.binding.context, listen: false).currentStep, equals(OnboardingSteps.enter_mobile_number));
    //   // expect(find.byType(OnboardingLocationView), findsNothing);
    //   // expect(find.byType(OnboardingMobileNumberView), findsOneWidget);
    // });

    // Add more test groups for additional test cases as needed.
  });
}
