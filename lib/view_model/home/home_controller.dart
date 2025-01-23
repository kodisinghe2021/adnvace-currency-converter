import 'package:advance_currency_converter_app/model/currency_flag.dart';
import 'package:advance_currency_converter_app/model/hive_model/hive_currency_model.dart';
import 'package:advance_currency_converter_app/repository/currency_flag_repository.dart';
import 'package:advance_currency_converter_app/repository/currency_rate_repository.dart';
import 'package:advance_currency_converter_app/repository/local_repo/local_repositoy.dart';
import 'package:advance_currency_converter_app/service/local_service/local_storing_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    String val = await getInitialAmount();
    if (val.isNotEmpty) {
      amountController.text = val;
    }
    addInitialFlagEvent();
  }

  final formKey = GlobalKey<FormState>();
  final LocalStoringService _localStoringService = LocalStoringService();
  final TextEditingController amountController =
      TextEditingController(text: "1.0");
  final CurrencyRepository _currencyRepository = CurrencyRepository();
  final CurrencyRateRepository _currencyRateRepository =
      CurrencyRateRepository();
  final LocalRepository _localRepo = LocalRepository();
  // final String baseCurrency = "USD";
  final List<CurrencyFlag> _selectedConvertedList = [];
  final List<Map<String, double>> rateList = [];
  late CurrencyFlag _currencyFlag;

  Future<void> saveInputAmount() async {
    if (amountController.text.isNotEmpty) {
      await _localStoringService.saveValue(
          AppLocalKeys.insertAmount.name, amountController.text);
    }
  }

  Future<void> changeBaseCurrency(String value) async {
    _localStoringService.saveValue(AppLocalKeys.baseCurrency.name, value);
  }

  Future<String> getBaseCurrency() async {
    return await _localStoringService.readValue(AppLocalKeys.baseCurrency.name);
  }

  Future<String> getInitialAmount() async {
    return await _localStoringService.readValue(AppLocalKeys.insertAmount.name);
  }

  void addToConvertedCurrency(CurrencyFlag flag) {
    _selectedConvertedList.add(flag);
    update();
  }

  void removeToConvertedCurrency(CurrencyFlag flag) {
    _selectedConvertedList.remove(flag);
  }

  Future<void> setRateList() async {}

  Future<void> convertAllList() async {
    // get input value
    double amount = double.parse(amountController.text);
    // get all local converted currencies
    List<HiveCurrencyModel> localCurrencyList =
        await _localRepo.getAllCurrencies();
    final codeList = localCurrencyList.map((e) => e.code).toList();
    String baseCurrency = await getBaseCurrency();
    if (baseCurrency.isEmpty) {
      baseCurrency = "USD";
    }
    debugPrint(
        "log-for getting currency: ${codeList.toString()} || ${baseCurrency.toString()}");
    final currencyRates = await _currencyRateRepository.getCurrency(
      baseCurrency: baseCurrency,
      toConvertList: codeList,
    );
    // update all currencies with fetched rates
    for (var localCurrency in localCurrencyList) {
      for (var k in currencyRates.keys) {
        if (localCurrency.code == k && currencyRates[k] != null) {
          double currentRate = currencyRates[k]!;
          double totalAmount = currentRate * amount;
          // update the local
          final updatedModel = localCurrency.copyWith(rateOnBase: totalAmount);
          await _localRepo.updateCurrency(updatedModel);
          break;
        }
      }
    }
  }

  List<CurrencyFlag> get getConvertedList => _selectedConvertedList;

  final BehaviorSubject<CurrencyFlag> _currencyFlagSubject = BehaviorSubject();

  Stream<CurrencyFlag> get getFlagStream => _currencyFlagSubject.stream;

  CurrencyFlag get currentCurrencyFlag => _currencyFlag;

  final RxInt selectedCurrencyIndex = RxInt(-1);

  late CurrencyFlag _flag;

  void setFlag(CurrencyFlag flag) {
    _flag = flag;
  }

  CurrencyFlag get getFlag => _flag;

  void setSelectedIndex(int index) {
    selectedCurrencyIndex.value = index;
    update();
  }

  Future<void> getCurrencyRate({
    required String baseCurrency,
    required CurrencyFlag flag,
  }) async {
    final data = await _currencyRateRepository
        .getCurrency(baseCurrency: baseCurrency, toConvertList: [flag.code]);

    double rate = data[flag.code]!.toDouble();
    debugPrint("data: ${data.toString()}");
    debugPrint("rate: ${rate.toString()}");
    await _localRepo.addCurrency(flag, rate);
  }

  // int get getSelectedIndex=> _selectedCurrencyIndex;

  Future<List<CurrencyFlag>> getAllCurrencyFlags() async =>
      _currencyRepository.getCurrencies();

  void selectCurrencyFlag(CurrencyFlag flag) {
    _currencyFlagSubject.sink.add(flag);
    _currencyFlag = flag;
  }

  void addInitialFlagEvent() async {
    debugPrint("log- initial event adding called");
    final list = await _currencyRepository.getCurrencies();
    String baseCurrency = await getBaseCurrency();
    if (baseCurrency.isEmpty) {
      baseCurrency = "USD";
    }
    for (var i in list) {
      if (i.code == baseCurrency) {
        _currencyFlagSubject.sink.add(i);
        _currencyFlag = i;
      }
    }
  }
}

enum AppLocalKeys { insertAmount, baseCurrency }
