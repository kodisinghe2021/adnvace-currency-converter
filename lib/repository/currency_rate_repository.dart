import 'dart:convert';

import 'package:advance_currency_converter_app/service/currency_rate_service/currency_rate_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyRateRepository {
  final CurrencyRateService _currencyRateService = CurrencyRateService();

  Future<Map<String, double>> getCurrency({
    required String baseCurrency,
    required List<String> toConvertList,
  }) async {
      debugPrint("log- toConvertList: ${toConvertList.toString()}");
    d.Response<dynamic>? res =
        await _currencyRateService.getRates(baseCurrency, toConvertList);
    if (res != null) {
      debugPrint("log- response: ${res.toString()}");
      debugPrint("log- response: ${res.data.toString()}");
      Map<String, double> rates = (res.data['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value.toDouble()),
      );
      return rates;
    } else {
      debugPrint("log- response: NULL");
      return {};
    }
  }
}
