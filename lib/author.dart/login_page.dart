import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopfee/on_board/onboarding_controller.dart';
import 'package:shopfee/route/route_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _text;
  bool isTextEmpty = false;

  @override
  void initState() {
    _text = TextEditingController();
    super.initState();
  }

  checkLogin() {
    var isText = _text.text;
    print(isText);
    if (!isText.isEmpty) {
      print('fsaf');
      Get.toNamed(RouteHelper.getHome());
    }
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('logo.png'),
                const SizedBox(height: 32),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: const [
                //       Text('No. Handphone'),
                //       SizedBox(
                //         height: 8,
                //       ),
                //       TextField(
                //         obscureText: true,
                //         decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(16.0)),
                //           ),
                //           labelText: 'Input your No. Handphone',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: 75,
                  width: 335,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('No. Handphone'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _text,
                        onChanged: (value) {
                          setState(() {
                            if (value.length > 0) {
                              isTextEmpty = true;
                            } else {
                              isTextEmpty = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.brown),
                          ),
                          hintText: 'Input your No. Handphone',
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, right: 20, top: 12),
                //   child: Container(
                //     height: 48,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(16.0)),
                //       color: Colors.grey,
                //     ),
                //     child: Center(
                //         child: const Text(
                //       'Login',
                //       style: TextStyle(fontSize: 14, color: Colors.white),
                //     )),
                //   ),
                // ),
                const SizedBox(height: 12),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => checkLogin(),
                  child: Container(
                    height: 48,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      color: isTextEmpty ? Colors.brown : Colors.grey,
                      // color: Colors.grey,
                    ),
                    child: const Center(
                        child: Text(
                      'Login',
                      // style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don’t have an account?'),
                TextButton(
                    onPressed: () => Get.toNamed(RouteHelper.getRegister()),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 14, color: Colors.brown),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
