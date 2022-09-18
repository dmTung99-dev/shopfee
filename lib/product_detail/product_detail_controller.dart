import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shopfee/route/route_helper.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == productDetailPages.length - 1;
  var pageController = PageController();

  List<ProductDetailInfo> productDetailPages = [
    ProductDetailInfo('assets/coffeeMilk1.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', 'Rp35.500', 'Coffee'),
  ];
}

class ProductDetailInfo {
  final imageAsset;
  final type;
  final tilte;
  final content;
  final rating;
  final promo_price;
  ProductDetailInfo(this.imageAsset, this.tilte, this.content, this.rating, this.promo_price, this.type,);
}
