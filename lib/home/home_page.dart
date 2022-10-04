import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopfee/controller/order_controller.dart';
import 'package:shopfee/home/discount_controller.dart';
import 'package:shopfee/home/fillter_controller.dart';
import 'package:shopfee/home/products_controller.dart';
import 'package:shopfee/route/route_helper.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final _controller = DiscountController();
   final _filerController = FilterController();
   final _productController = ProductController();
   final _orderController = OrderInformation();

  final  _scrollController = ScrollController();

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 64.0,
                backgroundColor: Color.fromARGB(255, 250, 249, 249),
                flexibleSpace:  SizedBox(
                     height: 64,
                     child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Expanded(
                           child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: new Icon(Icons.search),
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
                              )
                            ),
                         ),
                         const SizedBox(width: 20),
                        Image.asset('bell.png', height: 24, width: 24,),
                       ],
                     ),
                   ),
              ),
            ];
          }, 
          body:SingleChildScrollView(
            child: Column(
                  children: [
                   const SizedBox(height: 20),
                   SizedBox(
                    height: 150,
                    width: double.infinity,
                     child: PageView.builder(
                          controller: _controller.pageController,
                          onPageChanged: _controller.selectedPageIndex,
                          itemCount: _controller.onboardingPages.length,
                          itemBuilder: (context, index) {
                            return  ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  _controller.onboardingPages[index].imageAsset, fit: BoxFit.cover,),
                            );
                          }),
                   ),
                   DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch, 
                        children: <Widget>[
                        TabBar(
                          labelColor: Colors.brown,
                          unselectedLabelColor: Colors.brown[200],
                          indicator: MaterialIndicator(
                              color:Colors.brown ,
                              height: 5,
                              topLeftRadius: 5,
                              topRightRadius: 5,
                              bottomLeftRadius: 5,
                              bottomRightRadius: 5,
                              tabPosition: TabPosition.bottom,
                            ),
                          tabs: const[
                            Tab(child: Text('Coffee', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                            Tab(child: Text('Non Coffee', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                            Tab(child: Text('Pastry', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                          ],
                        ),
                        Container(
                          height: 1600, //height of TabBarView
                          decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                          ),
                          child: TabBarView(children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: 65,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(12),
                                    separatorBuilder: (context, index){
                                      return const SizedBox(width: 8);
                                    }, 
                                    itemCount: _filerController.filterPages.length,
                                    itemBuilder: (context, index) {
                                      return  Container(
                                        decoration: BoxDecoration(
                                          color: Colors.brown[50],
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            children: [
                                              Image.asset(_filerController.filterPages[index].imageAsset, height: 24, width: 24),
                                              Text(_filerController.filterPages[index].tilte, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
                                            ],
                                          ),
                                        ),
                                      );
                                    }, 
                                  ),
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: _productController.productPages.length,
                                  itemBuilder: (context,index){
                                    return GestureDetector(
                                      onTap: () {
                                        Get.put(OrderInformation()).updatePrice(
                                          promo_price: _productController.productPages[index].promo_price );
                                        Get.toNamed(RouteHelper.getProductDetail());
                                      },
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[100],
                                                    borderRadius: BorderRadius.circular(50)
                                                  ),
                                                  child: Image.asset(
                                                      _productController.productPages[index].imageAsset),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.star, color: Colors.yellow),
                                                        Text(_productController.productPages[index].rating, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                                                      ],
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: SizedBox(
                                                width: 378,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        // mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Text(_productController.productPages[index].tilte, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 20),
                                                            child: Text(_productController.productPages[index].promo_price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                      child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        //  mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Text(_productController.productPages[index].content, ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 20),
                                                            child: Text(_productController.productPages[index].price, style: TextStyle(decoration: TextDecoration.lineThrough),),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                )
                              ],
                            ),
                            const Center(
                              child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                            const Center(
                              child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ])
                        )
                      ]),
                    )
                  ),
                  ],
                ),
          ),
        ),
      )
    );
  }
}

