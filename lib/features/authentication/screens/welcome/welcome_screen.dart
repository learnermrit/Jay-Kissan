import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jay_kissan/common_widgets/fade_in_animation/animation_design.dart';
import 'package:jay_kissan/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:jay_kissan/constants/colors.dart';
import 'package:jay_kissan/constants/image_strings.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/authentication/screens/login/login_screen.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(FadeInAnimationController());
    Controller.startAnimation();
    var height = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMS: 1200,
            animate: TAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              rightAfter: 0,
              rightBefore: 0,
              topBefore: 0,
              topAfter: 0,
              leftBefore: 0,
              leftAfter: 0,
            ),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(tWelcomeScreenImage),
                    ),
                    Container(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Column(
                        children: [
                          Text(
                            tWelcomeTitle,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            tWelcomeSubtitle,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Get.to(LoginScreen()),
                              child: Text(
                                tLogin,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Get.to(SignupScreen()),
                              child: Text(tSignup),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
