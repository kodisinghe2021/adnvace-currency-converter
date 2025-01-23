import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/model/hive_model/hive_currency_model.dart';
import 'package:advance_currency_converter_app/service/local_service/local_storing_service.dart';
import 'package:flutter/widgets.dart';

class LocalRepository {
  final LocalStoringService _localStoringService = LocalStoringService();

  Future<void> addCurrency(CurrencyFlag flag, double rate) async {
    HiveCurrencyModel model = HiveCurrencyModel(
      code: flag.code,
      name: flag.name,
      country: flag.country,
      countryCode: flag.countryCode,
      flag: flag.flag,
      rateOnBase: rate,
    );
   await _localStoringService.addCurrency(model);
  }

  Future<void> updateCurrency(HiveCurrencyModel model) async {
   await _localStoringService.addCurrency(model);
  }


 Future<List<HiveCurrencyModel>> getAllCurrencies()async {
  try {
 List<HiveCurrencyModel> list = await _localStoringService.getAllCurrencies();
 return list;
    
  } catch (e) {
    debugPrint("log- error on local data receiving ${e.toString()}");
    return [];
  }
 }
}
