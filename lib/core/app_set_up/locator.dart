import 'package:get_it/get_it.dart';
import 'package:tezda_assessment/core/route_service/navigation_service.dart';

GetIt locatorX = GetIt.instance;
var navigator = locatorX<NavigationService>();

void setUpLocatorX() {
  locatorX.registerLazySingleton<NavigationService>(() => NavigationService());
}
