import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopfee/author.dart/login_page.dart';
import 'package:shopfee/on_board/onboarding_page.dart';
import 'package:shopfee/route/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home:  LoginPage(),
    // );

    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SplashScreen(),
          theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(239, 255, 255, 255)),
          initialRoute: RouteHelper.getProductDetail(),
          getPages: RouteHelper.routes,
        );
  }
}

