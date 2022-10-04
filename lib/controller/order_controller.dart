// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderInformation extends GetxController{

  String promo_price = "";
  num total_proce = 0;
  int quantity = 0 ;
  // String website = "";
  // String description = "";

  updatePrice({@required promo_price}){
    this.promo_price = promo_price;
    // print(promo_price);
    // this.total_proce = total_proce ;
    // this.website = website;
    // this.description = description;
    update();
  }

  updateTotalPrice({ @required total_proce, @required quantity}){
    this.quantity = quantity;
    this.total_proce = total_proce;
    update();
    // print(this.total_proce);
  }
}