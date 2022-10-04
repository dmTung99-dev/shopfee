
import 'package:get/get.dart';
import 'package:shopfee/author.dart/login_page.dart';
import 'package:shopfee/author.dart/register_page.dart';
import 'package:shopfee/checkout/checkout.dart';
import 'package:shopfee/home/home_bottom_navigation.dart';
import 'package:shopfee/home/home_page.dart';
import 'package:shopfee/on_board/onboarding_page.dart';
import 'package:shopfee/payment_method/payment_method.dart';
import 'package:shopfee/product_detail/product_detail.dart';
import 'package:shopfee/receipt/receipt_order.dart';
import 'package:shopfee/voucher/voucher.dart';
//7h50
class RouteHelper{

  static const String introPage = "/intro-page";
  static const String homePage = "/home";
  static const String loginPage = "/login-page";
  static const String registerPage = "/register-page";
  static const String productDetail = "/product_detail";
  static const String checkout = "/checkout";
  static const String paymentMethod = "/paymentMethod";
  static const String voucher = "/voucher";
  static const String receipt = "/receipt";

  static String getIntroPage()=> "$introPage";
  static String getHome()=> "$homePage";
  static String getLogin()=> "$loginPage";
  static String getRegister()=> "$registerPage";
  static String getProductDetail()=> "$productDetail";
  static String getCheckout()=> "$checkout";
  static String getPaymentMethod()=> "$paymentMethod";
  static String getVoucher()=> "$voucher";
  static String getReceipt()=> "$receipt";

  static List<GetPage> routes=[
    GetPage(name: introPage, page: ()=>OnboardingPage()),
    GetPage(name: loginPage, page: ()=>LoginPage()),
    GetPage(name: registerPage, page: ()=>RegisterPage()),
    GetPage(name: homePage, page: ()=>HomeNavigationPage()),
    GetPage(name: productDetail, page: ()=>ProductDetailOrder()),
    GetPage(name: checkout, page: ()=>Checkout()),
    GetPage(name: paymentMethod, page: ()=>PaymentMethod()),
    GetPage(name: voucher, page: ()=>Voucher()),
    GetPage(name: receipt, page: ()=>ReceiptOrder()),

  ];
}