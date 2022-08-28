import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopfee/route/route_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _textName;
  late TextEditingController _textHandPhone;

  bool isTextName = false;
  bool isTextHandPhone = false;

  @override
  void initState() {
    _textName = TextEditingController();
    _textHandPhone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textName.dispose();
    _textHandPhone.dispose();
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
                Container(
                  height: 75,
                  width: 335,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      SizedBox(height: 8),
                      TextField(
                        controller: _textName,
                        onChanged: (value) {
                          setState(() {
                            if (value.length > 0) {
                              isTextName = true;
                            } else {
                              isTextName = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
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
                          hintText: 'Input your Name',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 75,
                  width: 335,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('No. Handphone'),
                      SizedBox(height: 8),
                      TextField(
                        controller: _textHandPhone,
                        onChanged: (value) {
                          setState(() {
                            if (value.length > 0) {
                              isTextHandPhone = true;
                            } else {
                              isTextHandPhone = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
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
                const SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text('By tapping "Register" you agree to our '),
                      Text.rich(TextSpan(
                          text: 'Terms of Use',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('Tap Here onTap'),
                          children: [
                            TextSpan(
                              text: ' and ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => print('Tap Here onTap'))
                          ])),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 48,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                     color: isTextHandPhone && isTextName ? Colors.brown : Colors.grey,
                    // color: Colors.grey,
                  ),
                  child: const Center(
                      child: Text(
                    'Register',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account?'),
                TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Login',
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
