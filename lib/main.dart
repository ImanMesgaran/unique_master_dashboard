import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/services/service.dart';
import 'injection_container.dart' as di;
import 'services/navigation/routes/routes.dart';
//import '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await EasyLocalization.ensureInitialized();

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
