import 'package:advance_currency_converter_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    _initialNavigator();
  }

  void _initialNavigator()async{
    await Future.delayed( const Duration(seconds: 2));
    Get.offAllNamed(Routes.homeScreen);
  }
}