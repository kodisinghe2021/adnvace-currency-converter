import 'package:advance_currency_converter_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootHandler extends StatelessWidget {
   const RootHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData.from(
        colorScheme:  const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF9AA6B2),// Soft Purple
          onPrimary: Color(0xFF9AA6B2), // Deep Indigo
          secondary: Color(0xFF9AA6B2) ,// Teal Accent
          onSecondary: Color(0xFF9AA6B2),// Darker Teal
          error: Color(0xFFCF6679), // Light Red
          onError: Color(0xFFB00020), // Darker Red// Light Grey
          surface: Color(0xFF131010), // Darker Surface
          onSurface: Color(0xFFE0E0E0), 
          background: Color(0xFF131010), 
          onBackground: Color(0xFF131010), // Light Grey for Text on Surface
        ),
      ),
    );
  }
}
