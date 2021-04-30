import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart' as di;

class HelperConstants {
  static String currentLocale;

  HelperConstants() {
    SharedPreferences prefs = di.getIt<SharedPreferences>();

    currentLocale = prefs.getString(HelperConstants.CurrentLocale);

    if (currentLocale == null || currentLocale.isEmpty) currentLocale = 'en';
  }

  String get appName => 'Pctp';

  // Shared Preferences
  static const String USER_TOKEN = "user_token";
  static const String USER_ID = "user_id";
  static const String CurrentLocale = "current_locale";
}
