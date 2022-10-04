import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shopfee/route/route_helper.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == productPages.length - 1;
  var pageController = PageController();

  List<ProductInfo> productPages = [
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '14400', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', ''),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', ''),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', ''),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', ''),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
    ProductInfo('assets/coffeeMilk.png', 'Coffee Milk', 'Steamed milk with mocha and caramel sauces', '4.9', '35500', '38000'),
  ];
}

class ProductInfo {
  final imageAsset;
  final tilte;
  final content;
  final rating;
  final promo_price;
  final price;
  ProductInfo(this.imageAsset, this.tilte, this.content, this.rating, this.promo_price, this.price,);
}
