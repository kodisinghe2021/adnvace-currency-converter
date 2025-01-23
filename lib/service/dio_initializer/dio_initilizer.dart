import 'package:advance_currency_converter_app/service/api.dart';
import 'package:dio/dio.dart';

class DioInitializer {
  final Dio _dio = Dio();

  Dio getCurrencyDio(){
     _dio.options.baseUrl =Api.currencyBaseUrl;
    return _dio;
  }
}