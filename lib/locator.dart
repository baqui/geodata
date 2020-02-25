import 'package:get_it/get_it.dart';
import 'package:geodata/core/db/moor_database.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AppDatabase>(AppDatabase());
  //options to use => registerLazySingleton, registerSingleton, registerFactory
}
