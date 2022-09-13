
import 'package:get/get.dart';
import 'package:shopfee/author.dart/login_page.dart';
import 'package:shopfee/author.dart/register_page.dart';
import 'package:shopfee/home/home_bottom_navigation.dart';
import 'package:shopfee/home/home_page.dart';
import 'package:shopfee/on_board/onboarding_page.dart';
//7h50
class RouteHelper{

  static const String introPage = "/intro-page";
  static const String homePage = "/home";
  static const String loginPage = "/login-page";
  static const String registerPage = "/register-page";

  static String getIntroPage()=> "$introPage";
  static String getHome()=> "$homePage";
  static String getLogin()=> "$loginPage";
  static String getRegister()=> "$registerPage";

  static List<GetPage> routes=[
    GetPage(name: introPage, page: ()=>OnboardingPage()),
    GetPage(name: loginPage, page: ()=>LoginPage()),
    GetPage(name: registerPage, page: ()=>RegisterPage()),
    GetPage(name: homePage, page: ()=>HomeNavigationPage()),

  ];
}