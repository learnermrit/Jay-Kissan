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
import 'package:jay_kissan/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:jay_kissan/features/authentication/controllers/splash_screen_controler.dart';

import '../../../../constants/text_strings.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashScreenController());
    splashController.startAnimation();
    var animate = splashController.animate.value;

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top:
                  splashController.animate.value ? tDefaultSize : -tDefaultSize,
              left:
                  splashController.animate.value ? tDefaultSize : -tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  height: 800,
                  width: 500,
                  child: Image(
                    image: AssetImage(tSplashTopIcon),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              // jay kissan , we are because they are
              duration: const Duration(milliseconds: 1600),
              top: 160,
              left:
                  splashController.animate.value ? tDefaultSize : -tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      tAppTagLine,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                // man and tracter
                duration: const Duration(milliseconds: 1600),
                bottom: splashController.animate.value ? -150 : -250,
                right: 5,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    height: 800,
                    width: 500,
                    child: Image(
                      image: AssetImage(tSplashImage),
                    ),
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
              //green dot
              duration: const Duration(milliseconds: 1600),
              bottom: splashController.animate.value ? 40 : -40,
              right: tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  width: tSplashContainerSize,
                  height: tSplashContainerSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: tPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
