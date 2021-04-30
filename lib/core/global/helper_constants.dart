import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart' as di;

class HelperConstants {
  static String currentLocale;

  HelperConstants() {
    SharedPreferences prefs = di.getIt<SharedPreferences>();

    currentLocale = prefs.getString(HelperConstants.CurrentLocale);

    if (currentLocale == null || currentLocale.isEmpty) currentLocale = 'ar';
  }

  String get appName => 'Pctp';

  // Shared Preferences
  static const String USER_TOKEN = "user_token";
  static const String USER_ID = "user_id";
  static const String MODAL_iNSTRUCTION = "modal_instruction";
  static const String FIRST_APP_RUN = "first_run";
  static const String PaymentCallBack = "hemayati://payment";
  static const String CurrentLocale = "current_locale";
  static String defaultCountry = currentLocale == "en" ? "Iraq" : "عراق";
  static String defaultNationality = currentLocale == "en" ? "Iraqi" : "عراقی";
  static const String LastOtpRequest = "last_otp_request";
  static const String refreshCountriesDB = "last_otp_request";
}
