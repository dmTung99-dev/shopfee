import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shopfee/controller/order_controller.dart';
import 'package:shopfee/product_detail/product_detail_controller.dart';
import 'package:shopfee/route/route_helper.dart';

class ProductDetailOrder extends StatefulWidget {
  const ProductDetailOrder({Key? key}) : super(key: key);

  @override
  State<ProductDetailOrder> createState() => _ProductDetailOrderState();
}

class _ProductDetailOrderState extends State<ProductDetailOrder> {
  final _controller = ProductDetailController();
  final OrderInformation orderInformation = Get.find();
//  int parsedValue1 = int.tryParse(orderInformation.promo_price);
  int _quantity = 0;
  num _total = 0;
  var c;
  String variant = 'Ice';
  String size = 'Regular'; 
  String sugar = 'Normal'; 
  String ice = 'Normal'; 

  @override
  void initState(){
    super.initState();
    c = int.parse(orderInformation.promo_price);
    //  print(c);
// print(parsedValue1)
    // print('object'+myDouble);
  }

  @override
  void dispose(){
    super.dispose();
  }

  void setQuantity(bool isIncrement) {
    if(isIncrement ){
      print(c);
      _quantity = checkQuantity(_quantity+1);
      setState(() {
        _quantity;
        _total = _quantity * c ;
      });
      print("_total"+_total.toString());
      print("_quantity"+_quantity.toString());
    }else{
      setState(() {
        _quantity = checkQuantity(_quantity-1);
        _total = _quantity * c ;
      });
       print("_total"+_total.toString());
      print("_quantity"+_quantity.toString());
    }
  }

  int checkQuantity(int quantity){
    if( quantity <0){
      Get.snackbar("Item count!", "You can't reduce more!", backgroundColor: const Color(0xFF89dad0),
      colorText: Colors.white);
      return 0;
    }else if( quantity >20){
       Get.snackbar("Item count!", "You can't add more!", backgroundColor: const Color(0xFF89dad0),
      colorText: Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }
  
  void setVariant(String text){
    if(text=='Ice'){
      setState(() {
        variant = 'Ice';
      });
    }else if(text=='Hot'){
       setState(() {
        variant = 'Hot';
      });
    }
  }
  void setSugar(String text){
    if(text=='Normal'){
      setState(() {
        sugar = 'Normal';
      });
    }else if(text=='Less'){
       setState(() {
        sugar = 'Less';
      });
    }
  }
  void setIce(String text){
    if(text=='Normal'){
      setState(() {
        ice = 'Normal';
      });
    }else if(text=='Less'){
       setState(() {
        ice = 'Less';
      });
    }
  }
  void setSize(String text){
    if(text=='Regular'){
      setState(() {
        size = 'Regular';
      });
    }else if(text=='Medium'){
       setState(() {
        size = 'Medium';
      });
    }else if(text=='Large'){
       setState(() {
        size = 'Large';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 249, 249),
          title: Container(
            decoration: BoxDecoration(
            ),
            child: Row(
              children: [
                SizedBox(width: 20),
                Text('Customize Order', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 400,
              child: Image.asset('coffeeMilk1.png',fit: BoxFit.cover),
            )
          ),
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 249, 249),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Coffee',style: TextStyle(fontSize: 16,color: Colors.brown)),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Coffee Milk',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(orderInformation.promo_price,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ice americano + fresh milk ',style: TextStyle(fontSize: 16)),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setQuantity(false);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)
                                          )
                                        ),
                                        child: Icon(Icons.remove, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                      ),
                                      child: Center(child: Text(_quantity.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setQuantity(true);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5)
                                          )
                                        ),
                                        child: Icon(Icons.add, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow, size: 20),
                                  SizedBox(width: 5),
                                  Text('3.6', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 5),
                                  Text('(2.9)', style: TextStyle(fontSize: 14)),
                                  SizedBox(width: 5),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text('Ratings and reviews', style: TextStyle(fontSize: 14)),

                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.black,size: 20,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 249, 249),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(width: 1.0, color:Color.fromARGB(255, 202, 183, 177))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Customize',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Variant',style: TextStyle(fontSize: 16)),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setVariant('Ice');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: variant == 'Ice' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Ice',style: variant == 'Ice' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setVariant('Hot');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: variant == 'Hot' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child:Text('Hot',style: variant == 'Hot' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Size',style: TextStyle(fontSize: 16)),
                                Row(
                                  children: [
                                   GestureDetector(
                                      onTap: () {
                                        setSize('Regular');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: size == 'Regular' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Regular',style: size == 'Regular' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setSize('Medium');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: size == 'Medium' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Medium',style: size == 'Medium' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                     GestureDetector(
                                      onTap: () {
                                        setSize('Large');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: size == 'Large' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Large',style: size == 'Large' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sugar',style: TextStyle(fontSize: 16)),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setSugar('Normal');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: sugar == 'Normal' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Normal',style: sugar == 'Normal' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setSugar('Less');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: sugar == 'Less' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Less',style: sugar == 'Less' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ice',style: TextStyle(fontSize: 16)),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setIce('Normal');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: ice == 'Normal' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Normal',style: ice == 'Normal' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setIce('Less');
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: ice == 'Less' ? BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ) : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1.0, color:Colors.brown),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Text('Less',style: ice == 'Less' ? TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            )
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
                  Text(_total.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.put(OrderInformation()).updateTotalPrice(total_proce: _total, quantity: _quantity);
                  Get.toNamed(RouteHelper.getCheckout());
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: Center(child: Text('Add Order', style: TextStyle(fontSize: 18, color: Colors.white))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}