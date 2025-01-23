import 'package:advance_currency_converter_app/view_model/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}