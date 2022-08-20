import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shopfee/on_board/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    print(selectedPageIndex);
    print(isLastPage);
    if (isLastPage) {
      //go to home page
      selectedPageIndex = 0.obs;
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/choose.png', 'Choose and customize your Drinks',
        'Customize your own drink exactly how you like it by adding any topping you like!!!'),
    OnboardingInfo('assets/quickly.png', 'Quickly and easly',
        'You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone.'),
    OnboardingInfo('assets/discount.png', 'Get and Redeem Voucher',
        'Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!')
  ];
}
