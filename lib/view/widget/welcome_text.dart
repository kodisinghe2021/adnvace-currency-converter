import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      ),
    );
  }
}