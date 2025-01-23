part of 'app_pages.dart';

abstract class Routes{
  Routes._();
  static const String splashScreen = _Paths.splashScreen;
  static const String homeScreen = _Paths.homeScreen;
}

abstract class _Paths{
  _Paths._();
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
}