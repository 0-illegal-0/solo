import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/models/laptop_models.dart';
//import 'package:solo/models/speacial_offer.dart';
import 'package:solo/models/television_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_header.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_item.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/add_to_cart.dart';
import 'package:solo/view/widget/note.dart';

class SpecialOffer extends StatelessWidget {
  SpecialOffer(
      {Key? key, this.width, this.mainPadding, this.specialOfferItemDatas})
      : super(key: key);
  final double? mainPadding, width;
  final List? specialOfferItemDatas;

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
                    specialOfferItemDatas!.length > 4
                        ? 4
                        : specialOfferItemDatas!.length, (index) {
                  return index < 3
                      ? SpecialOfferItem(
                          loopIndex: index,
                          index: specialOfferItemDatas![index]["index"],
                          aspectRatio: specialOfferItemDatas![index]
                              ["aspectRatio"],
                          height: specialOfferItemDatas![index]["height"],
                          itemList: specialOfferItemDatas![index]["item-list"],
                          mainPadding: mainPadding!,
                          width: width!,
                          beforeDiscount:
                              specialOfferItemDatas![index]["item"].price!,
                          afterDicount:
                              specialOfferItemDatas![index]["item"].price!,
                          discount:
                              specialOfferItemDatas![index]["item"].discount!,
                          specialOfferImage:
                              specialOfferItemDatas![index]["item"].image!,
                          specialOfferTitle:
                              specialOfferItemDatas![index]["item"].title!,
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
                                    index: specialOfferItemDatas![index + index2]
                                        ["index"],
                                    aspectRatio:
                                        specialOfferItemDatas![index + index2]
                                            ["aspectRatio"],
                                    height: specialOfferItemDatas![index + index2]
                                        ["height"],
                                    itemList: specialOfferItemDatas![index + index2]
                                        ["item-list"],
                                    beforeDiscount:
                                        specialOfferItemDatas![index + index2]["item"]
                                            .price!,
                                    afterDicount:
                                        specialOfferItemDatas![index + index2]
                                                ["item"]
                                            .price!,
                                    discount: specialOfferItemDatas![index + index2]
                                            ["item"]
                                        .discount!,
                                    specialOfferImage:
                                        specialOfferItemDatas![index + index2]["item"].image!,
                                    specialOfferTitle: specialOfferItemDatas![index + index2]["item"].title!,
                                    imagePadding: 0),
                              ),
                            ),
                          )),
                        );
                }))
            : SpecialOfferNoMobile(
                specialOfferItemDatas: specialOfferItemDatas,
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
    this.specialOfferItemDatas,
    this.aspectRatio,
  }) : super(key: key);
  final double? width, imagePadding, aspectRatio;
  final List? specialOfferItemDatas;
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
        children: List.generate(specialOfferItemDatas!.length > itemCount!?itemCount!:specialOfferItemDatas!.length, (index) =>
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
                                    specialOfferItemDatas![index]["item"]
                                        .image!),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: Text(
                                specialOfferItemDatas![index]["item"].title!,
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
                                                    specialOfferItemDatas![index]["item"]
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
                                    "${specialOfferItemDatas![index]["item"]
                                        .oldPrice} EGP",
                                    style: const TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough),
                                  ),
                                  const Text(
                                    " 25% off",
                                    style: TextStyle(
                                        color: Color(0xFF32a852),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
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
                                      "${specialOfferItemDatas![index]["item"]
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
                                      addToCart(context:context,image: specialOfferItemDatas![index]["item"]
                                          .image!,price: specialOfferItemDatas![index]["item"]
                                          .price!,stars: specialOfferItemDatas![index]["item"]
                                          .stars,title: specialOfferItemDatas![index]["item"].title!,width: width);
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
                                  specialOfferItemDatas![index]
                                  ["aspectRatio"],
                                  height: width! *
                                      specialOfferItemDatas![index]
                                      ["height"],
                                  itemList:
                                  specialOfferItemDatas![index]
                                  ["item-list"],
                                  index: specialOfferItemDatas![index]
                                  ["index"],
                                  numberOfRows: 1,
                                  title: "Customer  Viewed",
                                ),
                            preventDuplicates: false);
                        Get.deleteAll();
                      })),
            ),)


    );
  }}