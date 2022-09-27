import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopfee/product_detail/product_detail_controller.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => PpaymentMethodState();
}

class PpaymentMethodState extends State<PaymentMethod> {
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
              Text('Payment Method', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: ListView(
          children: [
            ListTile(
              leading: Container(
                  height: 50, width: 50, child: Image.asset('gopay.png')),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GoPay',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Saldo:  Rp85.000'),
                  Divider(color: Colors.grey[300]),
                ],
              ),
              trailing: Radio(
                value: '',
                groupValue: '',
                onChanged: (String? value) {},
              ),
            ),
            ListTile(
              leading: Container(
                  height: 50, width: 50, child: Image.asset('credit.png')),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Credit or debit card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Visa, Mastercard, AMEX, and JCB'),
                ],
              ),
              trailing: Container(
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                    child: Text('Add',
                        style: TextStyle(fontSize: 18, color: Colors.white))),
              ),
              // isThreeLine: true,
            ),
            SizedBox(height: 30),
            Container(
              height:5,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.brown),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Container(
                  height: 50, width: 50, child: Image.asset('translate.png')),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transfer Bank',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('(Automatic Check)'),
                  Divider(color: Colors.grey[300]),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_down_outlined, size: 20,),
              // isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }
}