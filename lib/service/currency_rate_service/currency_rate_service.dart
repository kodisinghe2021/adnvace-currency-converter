import 'package:advance_currency_converter_app/service/api.dart';
import 'package:advance_currency_converter_app/service/dio_initializer/dio_initilizer.dart';
import 'package:advance_currency_converter_app/view/widget/show_snack.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyRateService {
  final DioInitializer _dioInitializer = DioInitializer();

  Future<d.Response<dynamic>?> getRates(
      String baseCurrency, List<String> toConvertList) async {
    Dio dio = _dioInitializer.getCurrencyDio();
    final Map<String, dynamic> qp = {
      "apikey": Api.currencyKey,
      "currencies": toConvertList.join(","),
      "base_currency": baseCurrency,
    };
    
    try {
      d.Response<dynamic> response = await dio.get(Api.currencyPath, queryParameters:qp);
      debugPrint("log- get currency response: ${response.toString()}");
      debugPrint("log- get request query param: ${response.requestOptions.queryParameters.toString()}");
      return response;
    } on DioException catch (e) {
      debugPrint("log- get request query param: ${e.requestOptions.queryParameters.toString()}");
      debugPrint("log- get currency dio error ${e.toString()}");
      showErrorSnack("local saving error $e");
      return null;
    } catch (e) {
      showErrorSnack("local saving error $e");
      return null;
    }
  }
}
