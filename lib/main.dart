import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/services/service.dart';
import 'injection_container.dart' as di;
import 'services/navigation/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('de', 'DE'), Locale('en', 'US')],
      path: 'assets/lang',
      startLocale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // Routing
      onGenerateRoute: Routes.getGeneratedRoute,
      navigatorKey: Service().navigation.getMainNavigatorKey,
      title: 'Dashboard',
      builder: (context, navigator) {
        var lang = Localizations.localeOf(context).languageCode;

        return Theme(
          data: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: "Poppins",
                ),
          ),
          child: navigator,
        );
      },
    );
  }
}
