import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/speacial_offer.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';

import '../../style.dart';

class CartBudget extends StatelessWidget {
  CartBudget({Key? key, this.controller}) : super(key: key);
  double? itemWidth, space;
  int? itemCount;
  double? width;
  final dynamic controller;

    sizesData (width){
      space = width! / 30;
      if (width! < 1000) {
        itemCount = 6;
        itemWidth =  width! / 3.7;
      }
      else {
        itemCount = 8;
        itemWidth= width! / 5.1;
      }
  }

  widthValue(context){
     width = MediaQuery.of(context).size.width;
  }

  execute(context){
     widthValue(context);
     sizesData(width);
  }
  @override
  Widget build(BuildContext context) {
    execute(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width! / 24, right: width! / 24, top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children:[
                    controller.items.length> 0?  GetBuilder<Cart>(
                   builder: (context) {
                     return width! >650?  Padding(
                       padding: const EdgeInsets.only(top:120),
                       child: Wrap(spacing: space!,runSpacing: 20,
                           children: List.generate(controller.items.length, (index)
                           {
                             return SizedBox(
                             width: itemWidth,
                             child: AspectRatio(
                                 aspectRatio: 0.9,
                                 child: InkWell(
                                     child: Container(
                                       decoration: const BoxDecoration(
                                           boxShadow: [
                                             BoxShadow(
                                                 color: Color(0xFF999797),
                                                 blurRadius: 10,
                                                 spreadRadius: 0.5,
                                                 offset: Offset(0, 0))
                                           ],
                                           color: Colors.white,
                                           borderRadius: BorderRadius.all(
                                               Radius.circular(5))),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment
                                             .spaceBetween,
                                         children: [
                                           Expanded(
                                             child: Padding(
                                               padding: EdgeInsets.all(
                                                   width! / 45 > 20 ? 20 : width! /
                                                       45),
                                               child: Image.asset(
                                                   solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                       .image!),
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 5),
                                             child: Text(
                                               solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                   .title!,
                                               maxLines: 2,
                                               textAlign: TextAlign.center,
                                             ),
                                           ),
                                           const SizedBox(height: 8),
                                           Padding(
                                               padding: const EdgeInsets.only(
                                                   left: 3),
                                               child: Row(
                                                   children: List.generate(
                                                       5,
                                                           (index2) =>
                                                           Icon(Icons.star_rate,
                                                               size: 17,
                                                               color: index2 <
                                                                   solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                                       .stars
                                                                   ? Colors.orange
                                                                   : Colors.grey)))),
                                           const SizedBox(height: 12),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment
                                                 .spaceBetween,
                                             children: [
                                               Expanded(
                                                 child: Padding(
                                                   padding: const EdgeInsets.only(
                                                       left: 5),
                                                   child: Text(
                                                     "${solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                         .price!} EGP ",
                                                     maxLines: 1,
                                                   ),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 25,
                                                 child: Builder(
                                                   builder: (context) {
                                                     return IconButton(
                                                       alignment: Alignment.topRight,
                                                       padding: const EdgeInsets.only(
                                                           right: 3, bottom: 3),
                                                       color: Colors.orange,
                                                       icon: const Icon(
                                                           Icons.shopping_cart_outlined),
                                                       onPressed: () {
                                                               controller.addToCart(context: context,
                                                             image: specialOfferItemDatas[index]["item"]
                                                                 .image!,
                                                             price: specialOfferItemDatas[index]["item"]
                                                                 .price!,
                                                             stars: specialOfferItemDatas[index]["item"]
                                                                 .stars,
                                                             title: specialOfferItemDatas[index]["item"]
                                                                 .title!,
                                                             width: width,
                                                             itemIndex: specialOfferItemDatas[index]['index'],
                                                             productItem:specialOfferItemDatas[index]['product-index']
                                                         );
                                                       },
                                                     );
                                                   }
                                                 ),
                                               )
                                             ],
                                           ),
                                           SizedBox(
                                             height: 25,
                                             child: Builder(
                                                 builder: (context) {
                                                 print("This is I in delete button ${controller.itemId[index]}");
                                                   return IconButton(
                                                     alignment: Alignment.topRight,
                                                     padding: const EdgeInsets.only(
                                                         right: 3, bottom: 3),
                                                     color: Colors.black,
                                                     icon: const Icon(
                                                       Icons.delete_outlined
                                                     ),
                                                     onPressed: () {
                                                       print("this is Id ${controller.itemId[index]}");
                                                       controller.deletePref(id:controller.itemId[index]);
                                                     },
                                                   );
                                                 }
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                     onTap: () {
                                       Get.to(
                                               () =>
                                               ViewDetails(
                                                 width: width,
                                                 aspectRatio:
                                                 specialOfferItemDatas[index]
                                                 ["aspectRatio"],
                                                 height: width! *
                                                     specialOfferItemDatas[index]
                                                     ["height"],
                                                 itemList:
                                                 specialOfferItemDatas[index]
                                                 ["item-list"],
                                                 index: specialOfferItemDatas[index]
                                                 ["index"],
                                                 numberOfRows: 1,
                                                 title: "Customer  Viewed",
                                               ),
                                           preventDuplicates: false);
                                       Get.deleteAll();
                                     })),
                           );},)),
                     ):CartWidgetForMobile(width: width,title: "",controller: controller,);
                   }
                 ):
                    Container(
                      alignment: Alignment.center,
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: width! / 14.4 < 70 ? 70 : width! / 14.4,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Your cart is empty",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 15,
                                          bottom: 15))),
                              onPressed: () {
                                Get.to(() => const HomePage());
                              },
                              child: const Text(
                                "Continue Shopping",
                                style: TextStyle(fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                  /*  device == DeviceType.Desktop
                        ? ViewItem(
                            aspectRatioMobile: 0.9,
                            height: width * 0.60,
                            itemList: tablets,
                            mainPadding: width / 24,
                            title: "Best Selling Products",
                            numberOfRows: 1,
                            aspectRatioNoMobile: 0.8,
                            width: width,
                            i: 6,
                          )
                        : MobileDesign(
                            aspectRatio: 1.1,
                            height: width * 0.50,
                            itemCount: tablets.length,
                            itemList: tablets,
                            title: "Best Selling Products",
                            width: width,
                          ),*/
                    const SizedBox(height: 50),
                    Close(width: width)
                  ],
                ),
              ),
            ), BottomRow(controller: controller),
            Head(width: width,controller: controller),
          ],
        ),
      ),
    );
  }
}


class CartWidgetForMobile extends StatelessWidget {
  const CartWidgetForMobile({Key? key, this.width, this.title, this.controller}) : super(key: key);

  final double? width;
  final String? title;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    double? designHeight, designWidth;
    designHeight = width! / 2.57 > 160 ? 160 : width! / 2.57;
    designWidth = width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        Wrap(
            alignment:WrapAlignment.center,
            crossAxisAlignment:WrapCrossAlignment.center,
            runSpacing: 15,
            children: List.generate(
              controller.items.length!,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                decoration:
                 BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                    BoxShadow(
                        color: Color(0xFF999797),
                        blurRadius: 7,
                        spreadRadius: 0.5,
                        offset: Offset(0, 0.5))
                ],/*border: Border.all(color: Colors.black, width: 1.0)*/),

                width: designWidth,
                height: designHeight,
                child: InkWell(
                    onTap: () {
                    /*  Get.to(
                              () => ViewDetails(
                            width: width!,
                            aspectRatio: item![index]["aspectRatio"],
                            height: item![index]["height"],
                            itemList: item![index]["item-list"],
                            index: item![index]["index"],
                            numberOfRows: 1,
                            title: "Customer  Viewed",
                          ),
                          preventDuplicates: false);
                      Get.deleteAll();*/
                    },
                 child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 5, top: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                .image!,
                                            height: designHeight! * 0.50,
                                          ),
                                          Text(
                                            solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])].title,
                                            softWrap: false,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          const Divider(
                                            height: 0,
                                            color: Colors.grey,
                                            indent: 00,
                                            endIndent: 0,
                                            thickness: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                      children: List.generate(
                                          5,
                                              (index2) => Icon(Icons.star_rate,
                                              size: 17,
                                              color: index2 < solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])]
                                                  .stars!
                                                  ? Colors.orange
                                                  : Colors.grey))),
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 5, left: 5),
                                    child: Text(
                                        solo.product[int.parse(controller.items[index][0])].products[int.parse(controller.items[index][1])].description,
                                        maxLines: 5),
                                  )),
                              const Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Divider(
                                    height: 0,
                                    color: Colors.grey,
                                    indent: 00,
                                    endIndent: 0,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                               Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "13.000 EGP",
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 25,
                                          child: Builder(
                                              builder: (context) {
                                                //  print("This is I in delete button ${controller.itemId[index]}");
                                                return IconButton(
                                                  alignment: Alignment.topRight,
                                                  padding: const EdgeInsets.only(
                                                      right: 3, bottom: 3),
                                                  color: Colors.black,
                                                  icon: const Icon(
                                                      Icons.delete_outlined
                                                  ),
                                                  onPressed: () {
                                                    controller.deletePref(id:controller.itemId[index]);
                                                  },
                                                );
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                ),
              ),
                  ),
            )),
      ],
    );
  }
}

