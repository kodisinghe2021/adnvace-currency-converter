import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorSnack(String des) => Get.snackbar("Error", des,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.red.withOpacity(.3));

showWarningSnack(String des) => Get.snackbar("Warning", des,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.orangeAccent.withOpacity(.3));
