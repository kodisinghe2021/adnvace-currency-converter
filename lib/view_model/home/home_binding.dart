import 'package:advance_currency_converter_app/view_model/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}