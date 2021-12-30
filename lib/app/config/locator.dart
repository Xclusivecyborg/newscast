import 'package:get_it/get_it.dart';
import 'package:newscast/services/api.dart';

final GetIt locator = GetIt.instance;

Future setupLocator() async{
  locator.registerLazySingleton(() => Api());
}