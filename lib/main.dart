import 'package:advance_currency_converter_app/model/hive_model/hive_currency_model.dart';
import 'package:advance_currency_converter_app/root_handler.dart';
import 'package:advance_currency_converter_app/service/local_service/local_storing_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveCurrencyModelAdapter());
  await dotenv.load(fileName: ".env");
  await Hive.openBox(LocalBox.currencyBox.name);
  await Hive.openBox(LocalBox.keyBox.name);
  //=====================================
  runApp(const RootHandler());
}
