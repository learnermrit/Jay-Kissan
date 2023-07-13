import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jay_kissan/constants/colors.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/authentication/controllers/on_boarding_controller.dart';
import 'package:jay_kissan/features/authentication/models/model_on_boarding.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/image_strings.dart';
import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingConroller();
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        LiquidSwipe(
          pages: obcontroller.pages,
          liquidController: obcontroller.controller,
          onPageChangeCallback: obcontroller.OnPageChangeCallback,
          slideIconWidget: Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
        ),
        Positioned(
          bottom: 60,
          child: OutlinedButton(
            onPressed: () => obcontroller.animateToNextSlide(),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.black26),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              onPrimary: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: tDarkColor, shape: BoxShape.circle),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
            onPressed: () => obcontroller.skip(),
            child: const Text("Skip", style: TextStyle(color: Colors.grey)),
          ),
        ),
        Obx(
          () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage.value,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 5.0),
              )),
        )
      ]),
    );
  }
}
