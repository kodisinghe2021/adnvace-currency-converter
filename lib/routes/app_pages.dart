import 'package:advance_currency_converter_app/view/home/home_screen.dart';
import 'package:advance_currency_converter_app/view/splash/splash_screen.dart';
import 'package:advance_currency_converter_app/view_model/home/home_binding.dart';
import 'package:advance_currency_converter_app/view_model/splash/splash_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splashScreen;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
