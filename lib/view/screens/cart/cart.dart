import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo/controllers/add_data.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/speacial_offer.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';

class Cart2 extends StatelessWidget {
   Cart2({Key? key,this.share, this.controller}) : super(key: key);
  @override
  double? itemWidth, space;
  int? itemCount;
  double? width;
  final controller;
   final SharedPreferences? share;

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
  Widget build(BuildContext context) {
    execute(context);
   // Cart controller = Get.put(Cart());
    AllData inst = AllData(context: context);
   // controller.showItem();

   // print
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
                     return  Padding(
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
                                               specialOfferItemDatas[index]["item"]
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
                                                                   specialOfferItemDatas[index]["item"]
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
                                                     "${specialOfferItemDatas[index]["item"]
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
                                                             prductItem: specialOfferItemDatas[index]['product-index']
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
                                                   return IconButton(
                                                     alignment: Alignment.topRight,
                                                     padding: const EdgeInsets.only(
                                                         right: 3, bottom: 3),
                                                     color: Colors.orange,
                                                     icon: const Icon(
                                                         Icons.shopping_cart_outlined),
                                                     onPressed: () {
                                                       controller.deletePref(id:index);
                                                       print("This is index $index");
                                                     },
                                                   );
                                                 }
                                             ),
                                           )
                                         /*  Row(children: [

                                           ])*/
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
                     );
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
                            title: "Mobiles",
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
                    Fotter(width: width)
                  ],
                ),
              ),
            ),const BottomRow(),
            Head(width: width),
          ],
        ),
      ),
    );
  }
}
