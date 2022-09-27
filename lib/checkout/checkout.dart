import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopfee/product_detail/product_detail_controller.dart';
import 'package:shopfee/route/route_helper.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _controller = ProductDetailController();
  int _quantity = 0;
  String variant = 'Ice';
  String size = 'Regular';
  String sugar = 'Normal';
  String ice = 'Normal';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _quantity = checkQuantity(_quantity + 1);
      });
      print("inscrement" + _quantity.toString());
    } else {
      setState(() {
        _quantity = checkQuantity(_quantity - 1);
      });
      print("decrement" + _quantity.toString());
    }
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count!", "You can't reduce more!",
          backgroundColor: const Color(0xFF89dad0), colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count!", "You can't add more!",
          backgroundColor: const Color(0xFF89dad0), colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void setVariant(String text) {
    if (text == 'Ice') {
      setState(() {
        variant = 'Ice';
      });
    } else if (text == 'Hot') {
      setState(() {
        variant = 'Hot';
      });
    }
  }

  void setSugar(String text) {
    if (text == 'Normal') {
      setState(() {
        sugar = 'Normal';
      });
    } else if (text == 'Less') {
      setState(() {
        sugar = 'Less';
      });
    }
  }

  void setIce(String text) {
    if (text == 'Normal') {
      setState(() {
        ice = 'Normal';
      });
    } else if (text == 'Less') {
      setState(() {
        ice = 'Less';
      });
    }
  }

  void setSize(String text) {
    if (text == 'Regular') {
      setState(() {
        size = 'Regular';
      });
    } else if (text == 'Medium') {
      setState(() {
        size = 'Medium';
      });
    } else if (text == 'Large') {
      setState(() {
        size = 'Large';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 236, 236),
        title: Container(
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Text('Checkout', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Image.asset('coffeeMilk2.png',
                                fit: BoxFit.cover)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Coffee Milk',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('Rp25.000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Ice, Regular, Normal Sugar, Normal Ice',
                                        style: TextStyle(fontSize: 16)),
                                    Text('x1', style: TextStyle(fontSize: 16))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.edit_calendar_outlined),
                                        SizedBox(width: 15),
                                        Text('Edit',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons
                                              .restore_from_trash_outlined),
                                          SizedBox(width: 15),
                                          GestureDetector(
                                            onTap: () {
                                              setQuantity(false);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5))),
                                              child: Icon(Icons.remove,
                                                  color: Colors.grey[700]),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey),
                                            ),
                                            child: Center(
                                                child: Text(
                                              _quantity.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setQuantity(true);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5))),
                                              child: Icon(Icons.add,
                                                  color: Colors.brown),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios,
                            size: 16, color: Colors.brown),
                        SizedBox(width: 10),
                        Text(
                          'Add Order',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.brown),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('When do you want order?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text('*We are open from 08.00 - 20.00 WIB',
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('As Soon as Possible',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Now - 10 Minute')
                        ],
                      ),
                      Radio(
                          value: '',
                          groupValue: '',
                          onChanged: (String? value) {}),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey[300]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Later',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Schedule Pick Up')
                        ],
                      ),
                      Radio(
                          value: '',
                          groupValue: '',
                          onChanged: (String? value) {}),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey[300]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Payment Method',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Gopay (Rp85.000)')
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getPaymentMethod());
                        },
                        child: Icon(Icons.arrow_forward_ios,
                            size: 25, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey[300]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Voucher',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('no voucher added')
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getVoucher());
                        },
                        child: Icon(Icons.arrow_forward_ios,
                            size: 25, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey[300]),
                ],
              ),
            ),
          )),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.brown),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text('Payment Summary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text('Rp 25000', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Voucher',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text('Discount 15%', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 15),
                  Text('Rp. 25.000',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              Container(
                height: 55,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                    child: Text('Add Order',
                        style: TextStyle(fontSize: 18, color: Colors.white))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
