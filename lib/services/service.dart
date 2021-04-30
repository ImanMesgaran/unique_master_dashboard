import '../injection_container.dart' as di;
import 'navigation/navigation_service_interface.dart';

class Service {
  static final Service _instance = Service._privateConstructor();
  final navigation = di.getIt<INavigationService>();

  Service._privateConstructor();

  factory Service() => _instance;
}
