import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String getCurrency({required String baseCurrency, required String requestCurrency})=>  dotenv.get("GET_CURRENCY");
  static final String currencyBaseUrl =  dotenv.get("GET_CURRENCY_BASE_URL");
  static final String currencyPath =  dotenv.get("GET_CURRENCY_PATH");
  static final String currencyKey =  dotenv.get("GET_CURRENCY_KEY");

  static final String concatKey = dotenv.get("CONCAT_KEY");
}