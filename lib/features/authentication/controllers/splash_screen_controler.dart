import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:jay_kissan/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;
  // Rx bool means getx boolean that it change will be obserbed
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 5000));

    animate.value = true;

    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(WelcomeScreen());
  }
}
