class OnboardingLocalization {
  OnboardingLocalization._();

  static Map<String, String> en = {
    OnboardingStrings.welcomeToAppreciate: "Welcome to appreciate",
    OnboardingStrings.startOfferingAppreciate: "Start offering Appreciate KYC service at your shop",
  };

  static Map<String, String> hi = {
    OnboardingStrings.welcomeToAppreciate: "सराहना करने के लिए आपका स्वागत है",
    OnboardingStrings.startOfferingAppreciate: "अपनी दुकान पर एप्रिसिएट केवाईसी सेवा की पेशकश शुरू करें",
  };
}

abstract class OnboardingStrings {
  static const welcomeToAppreciate = "welcome_to_appreciate";
  static const startOfferingAppreciate = "start_offering_appreciate";
}
