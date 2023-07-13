import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/image_strings.dart';
import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMS,
    this.animate,
    required this.child,
  });

  final Controller = Get.put(FadeInAnimationController());
  final int durationInMS;
  final TAnimatePosition? animate;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
      // as this is stateless widgit we need obx as observers to change its value
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMS),
        top: Controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            Controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: Controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: Controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMS),
          opacity: Controller.animate.value ? 1 : 0,
          child: child,
          // child: Image(
          //   image: AssetImage(tSplashTopIcon),
        ),
      ),
    );
  }
}
