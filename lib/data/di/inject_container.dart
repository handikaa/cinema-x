import '../dio_client/dio_client.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

Future<void> init({required String baseUrl}) async {
  //api

  print('jalanin init');
  inject.registerLazySingleton(() => DioClient(baseUrl));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
}
