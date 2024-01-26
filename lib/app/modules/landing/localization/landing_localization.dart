class AppLandingLocalization {
  AppLandingLocalization._();

  static Map<String, String> en = {
    LoginTranslations.agent: "Agent",
    LoginTranslations.admin: "Admin",
  };

  static Map<String, String> hi = {
    LoginTranslations.agent: "प्रतिनिधि",
    LoginTranslations.admin: "प्रशासक",
  };
}

abstract class LoginTranslations {
  static const agent = 'agent';
  static const admin = 'admin';
}
