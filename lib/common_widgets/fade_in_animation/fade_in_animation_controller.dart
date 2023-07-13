import 'package:get/get.dart';
import 'package:jay_kissan/features/authentication/screens/welcome/welcome_screen.dart';

import '../../features/authentication/screens/on_boarding/on_boarding_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find =>
      Get.find(); //to be used without calling its instances
  RxBool animate = false.obs; // when it will change it will be notified by getx

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    Get.offAll(() => WelcomeScreen()); // this will replace all activity created before
    // Get.to(WelcomeScreen());
    //Get.to(OnBoardingScreen()); //just to navigate as below line
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
   Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));

    animate.value = true;

   
  }
}
