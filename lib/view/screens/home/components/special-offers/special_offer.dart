//ignore: must_be_immutable
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_header.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_item.dart';
import 'package:solo/view/screens/view-details/view_details.dart';


class SpecialOffer extends StatelessWidget {
  const SpecialOffer(
      {Key? key, this.width, this.mainPadding, this.data})
      : super(key: key);
  final double? mainPadding, width;
  final List? data;

  double get space {
    return width! / 36;
  }

  double get marginTop {
    return width! / 18 < 33 ? 33 : width! / 18;
  }

  double get shadowWidth {
    return width! / 9;
  }

  double get shadowHeight {
    return width! / 24;
  }

  double get footerWidth {
    return width! / 4.5;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       SpecialOfferHeader(
          width: width,
          topMargin: shadowHeight,
          marginTop: marginTop,
          semtricMargin: shadowWidth,
          shadowWidth: shadowWidth,
          shadowHeight: shadowHeight,
          title: "Special Offers",
        ),
        device == DeviceType.Mobile
            ? Wrap(
                spacing: space,
                runSpacing: space,
                children: List.generate(
                    data!.length > 4
                        ? 4
                        : data!.length, (index) {
                  return index < 3
                      ? SpecialOfferItem(
                          loopIndex: index,
                          index: data![index]["index"],
                          aspectRatio: data![index]
                              ["aspectRatio"],
                          height: data![index]["height"],
                          itemList: data![index]["item-list"],
                          mainPadding: mainPadding!,
                          width: width!,
                          beforeDiscount:
                              data![index]["item"].price!,
                          afterDicount:
                              data![index]["item"].price!,
                          discount:
                              data![index]["item"].discount!,
                          specialOfferImage:
                              data![index]["item"].image!,
                          specialOfferTitle:
                              data![index]["item"].title!,
                          productItem: data![index]["product-index"],
                          imagePadding: 5)
                      : SizedBox(
                          height: width! * 0.6,
                          width: width! / 2.8,
                          child: Column(
                              children: List.generate(
                            2,
                            (index2) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: index2 == 0 ? 2.5 : 0,
                                    top: index2 == 1 ? 2.5 : 0),
                                child: SpecialOfferItem(
                                    loopIndex: index,
                                    mainPadding: mainPadding!,
                                    width: width!,
                                    index: data![index + index2]
                                        ["index"],
                                    productItem: data![index + index2]["product-index"],
                                    aspectRatio:
                                        data![index + index2]
                                            ["aspectRatio"],
                                    height: data![index + index2]
                                        ["height"],
                                    itemList: data![index + index2]
                                        ["item-list"],
                                    beforeDiscount:
                                        data![index + index2]["item"]
                                            .price!,
                                    afterDicount:
                                        data![index + index2]
                                                ["item"]
                                            .price!,
                                    discount: data![index + index2]
                                            ["item"]
                                        .discount!,
                                    specialOfferImage:
                                        data![index + index2]["item"].image!,
                                    specialOfferTitle: data![index + index2]["item"].title!,
                                    imagePadding: 0),
                              ),
                            ),
                          )),
                        );
                }))
            : SpecialOfferNoMobile(
                data: data,
                imagePadding: 5,
                aspectRatio: 0.9,
                width: width)
      ],
    );
  }
}

class SpecialOfferNoMobile extends StatelessWidget {
   SpecialOfferNoMobile({
    Key? key,
    this.width,
    this.imagePadding,
    this.data,
    this.aspectRatio,
  }) : super(key: key);
  final double? width, imagePadding, aspectRatio;
  final List? data;
  double? itemWidth;
  int? itemCount;

  double get space {
    return width! / 30;
  }

    getItemWidth() {
    if (width! < 1000) {
      itemCount = 6;
      itemWidth =  width! / 3.7;
    }
    else {
      itemCount = 8;
      itemWidth= width! / 5.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    getItemWidth();
    return Wrap(
        spacing: space,
        runSpacing: 20,
        children: List.generate(data!.length > itemCount!?itemCount!:data!.length, (index) =>
            SizedBox(
              width: itemWidth,
              child: AspectRatio(
                  aspectRatio: aspectRatio!,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    width! / 45 > 20 ? 20 : width! / 45),
                                child: Image.asset(
                                    data![index]["item"]
                                        .image!),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Text(
                                data![index]["item"].title!,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Row(
                                    children: List.generate(
                                        5,
                                            (index2) =>
                                            Icon(Icons.star_rate,
                                                size: 17,
                                                color: index2 <
                                                    data![index]["item"]
                                                        .stars
                                                    ? Colors.orange
                                                    : Colors.grey)))),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${data![index]["item"]
                                        .oldPrice} EGP",
                                    style: const TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      " 25% off",
                                      maxLines: 1,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Color(0xFF32a852),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "${data![index]["item"]
                                          .price!} EGP ",
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: IconButton(
                                    alignment: Alignment.topRight,
                                    padding: const EdgeInsets.only(
                                        right: 3, bottom: 3),
                                    color: Colors.orange,
                                    icon: const Icon(
                                        Icons.shopping_cart_outlined),
                                    onPressed: () {
                                      Cart controller = Get.put(Cart());
                                      controller.addToCart(context:context,image: data![index]["item"]
                                          .image!,price: data![index]["item"]
                                          .price!,stars: data![index]["item"]
                                          .stars,title: data![index]["item"].title!,width: width,
                                        itemIndex: data![index]['index'],
                                        productItem: data![index]['product-index']
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {

                        Get.to(
                                () =>
                                ViewDetails(
                                  width: width!,
                                  aspectRatio:
                                  data![index]
                                  ["aspectRatio"],
                                  height: width! *
                                      data![index]
                                      ["height"],
                                  itemList:
                                  data![index]
                                  ["item-list"],
                                  productItem: data![index]['product-index'],
                                  index: data![index]
                                  ["index"],
                                  numberOfRows: 1,
                                  title: "Customer  Viewed",
                                //  controller: controller,
                                ),
                           /* preventDuplicates: false*/);
                      //  Get.deleteAll();
                      })),
            ),)


    );
  }}
