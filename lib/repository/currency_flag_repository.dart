import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/service/currency_flags_service/currency_flag_service.dart';
import 'package:flutter/material.dart';

class CurrencyRepository {
  final CurrencyFlagService _currencyService = CurrencyFlagService();

  Future<List<CurrencyFlag>> getCurrencies()async{
  final flags =  _currencyService.getFlags;
    await Future.delayed( const Duration(milliseconds: 3)); // this for ensure value assign
    List<CurrencyFlag> flagList = [];

    for (var flag in flags) {
      flagList.add(CurrencyFlag.fromMap(flag));
    }
    debugPrint("log- Flag List length: ${flagList.length}");
    return flagList;
  }
}