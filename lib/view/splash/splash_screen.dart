import 'package:advance_currency_converter_app/util/constant/constants.dart';
import 'package:advance_currency_converter_app/view/widget/welcome_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WelcomeText(),
          ],
        ),
      ),
    );
  }
}

