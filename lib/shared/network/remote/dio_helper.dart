import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    try {
      dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
