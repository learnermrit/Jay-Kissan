
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingConroller extends GetxController{
   final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
        tonBoardingImage1,
        tOnBoardingTitle1,
        tOnBoardingSubTitle1,
        tOnBoardingCounter1,
        tOnBoardingPage1Color,
        
      )),
      OnBoardingPage(
          model: OnBoardingModel(
        tonBoardingImage2,
        tOnBoardingTitle2,
        tOnBoardingSubTitle2,
        tOnBoardingCounter2,
        tOnBoardingPage2Color,
        
      )),
      OnBoardingPage(
          model: OnBoardingModel(
        tonBoardingImage3,
        tOnBoardingTitle3,
        tOnBoardingSubTitle3,
        tOnBoardingCounter3,
        tOnBoardingPage3Color,
       
      )),
    ];

OnPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip()=> controller.jumpToPage(page: 2);

  animateToNextSlide(){
     int nextPage = controller.currentPage + 1;
              controller.animateToPage(page: nextPage);
  }
    
}