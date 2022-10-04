import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopfee/controller/order_controller.dart';
import 'package:shopfee/product_detail/product_detail_controller.dart';

class ReceiptOrder extends StatefulWidget {
  const ReceiptOrder({Key? key}) : super(key: key);

  @override
  State<ReceiptOrder> createState() => PReceiptOrderState();
}

class PReceiptOrderState extends State<ReceiptOrder> {
final OrderInformation orderInformation = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              Text('Receipt Order', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 250),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ListView(
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('Thank you!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text('Your transaction was successful'),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ID Transaction',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('D123456789ABC')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('10 July’22')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Time',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('04:13 PM')
                              ],
                            ),
                            Divider(color: Colors.brown[300]),
                            Text('Item', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Coffee Milk',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('x1')
                              ],
                            ),
                            SizedBox(height: 5),
                            Text('Ice, Regular, Normal Sugar, Normal Ice'),
                            SizedBox(height: 10),
                            Text('Payment Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price'),
                                Text(orderInformation.promo_price)
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Voucher'),
                                Text('0')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(orderInformation.total_proce.toString())
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment Method',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Gopay')
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Schedule Pick Up',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('05.15 PM')
                              ],
                            ),
                          ],
                        ),
                        
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          Positioned(
            top: 20,
            child: Image.asset('success.png')
          ),
          Positioned(
            bottom: 150,
            child:  Container(
                height: 55,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: Center(child: Text('Tracking Order', style: TextStyle(fontSize: 18, color: Colors.white))),
              )
          )
        ],
      ),
    );
  }
}