import 'package:advance_currency_converter_app/model/hive_model/hive_currency_model.dart';
import 'package:advance_currency_converter_app/view/widget/show_snack.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStoringService {
  LocalStoringService._internal();
  static final LocalStoringService _instance = LocalStoringService._internal();
  factory LocalStoringService() => _instance;

  Future<void> addCurrency(HiveCurrencyModel model) async {
    try {
      Box box = LocalBoxes.getCurrencyBox;
      await box.put(model.code, model);
      debugPrint(
          "log- successfully added one value to local: ${model.toString()}");
    } catch (e) {
      showErrorSnack("Failed to save currency in local");
    }
  }

  ValueListenable<Box>? currencyListener() {
    Box box = LocalBoxes.getCurrencyBox;
    if (box.isOpen) {
      return box.listenable();
    } else {
      return null;
    }
  }

  Future<List<HiveCurrencyModel>> getAllCurrencies() async {
    Box box = LocalBoxes.getCurrencyBox;
    List<HiveCurrencyModel> list = [];
    try {
      for (var key in box.keys) {
        dynamic val = box.get(key);
        if (val != null) {
          HiveCurrencyModel m = val as HiveCurrencyModel;
          list.add(m);
        }
      }
    } catch (e) {
      debugPrint("log- error on local data fetching ${e.toString()}");
    }
    return list;
  }

  Future<void> saveValue(String key, String value) async {
    try {
      final box = LocalBoxes.getKeysBox;
      await box.put(key, value);
    } catch (e) {
      showErrorSnack("local saving failed ${e.toString()}");
    }
  }

  Future<String> readValue(String key) async {
    final box = LocalBoxes.getKeysBox;
    String? val = box.get(key);
    return val ?? "";
  }
}

class LocalBoxes {
  static Box<dynamic> get getCurrencyBox => Hive.box(LocalBox.currencyBox.name);
  static Box<dynamic> get getKeysBox => Hive.box(LocalBox.keyBox.name);
}

enum LocalBox { currencyBox, keyBox }
