import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopfee/product_detail/product_detail_controller.dart';
import 'package:shopfee/route/route_helper.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => VoucherState();
}

class VoucherState extends State<Voucher> {
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
              
              SizedBox(width: 20),
              Text('Voucher', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide(width: 1, color: Colors.brown),
                ),
                hintText: 'Enter the voucher code here',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('discount.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc 10% up to Rp20.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('No minimum purchase', style: TextStyle(fontSize: 14)),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                      border: Border.all(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(Icons.check, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('discount.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc 10% up to Rp20.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('No minimum purchase', style: TextStyle(fontSize: 14)),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('bca.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc Rp75.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[200])),
                        SizedBox(height: 5),
                        Text('Minimum spend Rp280.000', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('Spend another RP100,000 to enjoy this voucher', style: TextStyle(fontSize: 14, color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('bca.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc Rp75.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[200])),
                        SizedBox(height: 5),
                        Text('Minimum spend Rp280.000', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('Spend another RP100,000 to enjoy this voucher', style: TextStyle(fontSize: 14, color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('bca.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc Rp75.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[200])),
                        SizedBox(height: 5),
                        Text('Minimum spend Rp280.000', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('Spend another RP100,000 to enjoy this voucher', style: TextStyle(fontSize: 14, color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('bca.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc Rp75.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[200])),
                        SizedBox(height: 5),
                        Text('Minimum spend Rp280.000', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('Spend another RP100,000 to enjoy this voucher', style: TextStyle(fontSize: 14, color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image.asset('bca.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disc Rp75.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[200])),
                        SizedBox(height: 5),
                        Text('Minimum spend Rp280.000', style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Text('Spend another RP100,000 to enjoy this voucher', style: TextStyle(fontSize: 14, color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.brown[300]),
          ],
        ),
      ),
    );
  }
}
