import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shopfee/route/route_helper.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == filterPages.length - 1;
  var pageController = PageController();

  List<FilterInfo> filterPages = [
    FilterInfo('assets/filterIcon.png', 'Filter'),
    FilterInfo('assets/starIcon.png', 'Rating 4.5+'),
    FilterInfo('assets/dolarIcon.png', 'Price',),
    FilterInfo('assets/promoIcon.png', 'Promo'),
  ];
}

class FilterInfo {
  final imageAsset;
  final tilte;
  FilterInfo(this.imageAsset, this.tilte);
}
