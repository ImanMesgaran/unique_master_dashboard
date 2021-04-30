import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/schedules/presentation/cubit/cubit/drawer_cubit.dart';
import 'services/navigation/navigation_service.dart';
import 'services/navigation/navigation_service_interface.dart';
import 'services/navigation/routes/custom_navigators.dart';
import 'services/navigation/routes/custom_navigators_interface.dart';

GetIt getIt = GetIt.instance;

class AppLocale {
  String locale;

  AppLocale({this.locale});

  String currentLocale() => locale;
}

Future<void> init() async {
  getIt.registerLazySingleton(() => AppLocale());

  // * Bloc's
  getIt.registerFactory(
    () => DrawerCubit(),
  );

  /*getIt.registerFactory(
    () => HomeCubit(
      getLatestNews: getIt(),
      getServicesCategory: getIt(),
      getServicesCategoryById: getIt(),
      postFCMToken: getIt(),
      getHealthStatus: getIt(),
      getUserProfile: getIt(),
    ),
  );*/

  // * Use Cases

  // ! Home Bloc UseCases
  // getIt.registerLazySingleton(() => GetServiceCategories(getIt()));

  // * Repository

  // ! Home repository
  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
  //       remoteDataSource: getIt(),
  //       networkInfo: getIt(),
  //     ));

  // * Data Sources

  // ! Home DataSources
  /*getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      client: getIt(),
    ),
  );*/

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  // currently, there's some bugs in this library so we have to work with the
  // default connectivity plugin.
  getIt.registerLazySingleton(() => DataConnectionChecker());

  //getIt.registerLazySingleton(() => HelperConstants());

  // ! Database stuff

  // ! Services
  getIt.registerLazySingleton<ICustomNavigators>(() => CustomNavigators());
  getIt.registerLazySingleton<INavigationService>(() => NavigationService());

  // ! Error Actions
}
