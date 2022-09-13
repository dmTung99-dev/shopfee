import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shopfee/route/route_helper.dart';
import 'package:get/get.dart';

class DiscountController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  List<DisccountInfor> onboardingPages = [
    DisccountInfor('assets/promo.png'),
    DisccountInfor('assets/logo.png'),
    DisccountInfor('assets/promo.png')
  ];
}

class DisccountInfor {
  final imageAsset;
  DisccountInfor(this.imageAsset);
}
