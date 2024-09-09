import 'package:dio/dio.dart';
import 'api_constant.dart';

class DioClient {
  final String apiBaseUrl;

  int errorToken = 0;

  DioClient(
    this.apiBaseUrl,
  );
  Dio get dio => getDio();

  Dio getDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrlMovie,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstant.accesToken}'
        },
      ),
    );

    return dio;
  }
}
