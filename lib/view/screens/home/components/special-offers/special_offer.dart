import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/speacial_offer.dart';
import 'package:solo/models/television_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_header.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_item.dart';

class SpecialOffer extends StatelessWidget {
  SpecialOffer({Key? key, this.width, this.mainPadding}) : super(key: key);
  final double? width;
  final double? mainPadding;
  double get marginTop {
    return width! / 13;
  }

  double get space {
    return width! / 36;
  }

  double get shadowWidth {
    return width! / 9;
  }

  double get shadowHeight {
    return width! / 24;
  }

  double get topMargin {
    return width! / 24;
  }

  double get semtricMargin {
    return width! / 9;
  }

  double get footerWidth {
    return width! / 4.5;
  }

  double brandGrid(int? countItem, double? boxWidth) {
    return (width! - (mainPadding! * 2) - (space * (countItem! - 1))) *
        boxWidth!;
  }

  static const BoxDecoration specialOfferDecoration = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Color(0xFFc2c2c2),
        blurRadius: 10,
        spreadRadius: 0.1,
        offset: Offset(0, 5))
  ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)));

  double? heightValue;
  double? widthValue;
  Widget widget() {
    for (var i = 0; i < specialOfferItemDatas.length - 2; i++) {
      if (specialOfferItemDatas[i]["imageSize"] == "large") {
        heightValue = 0.60;
        widthValue = 0.60;
      } else {
        heightValue = 0.40;
        widthValue = 0.50;
      }
      print(i);
      return SpecialOfferItem(
          gridCount: 2,
          heightValue: heightValue!,
          widthValue: widthValue!,
          mainPadding: mainPadding!,
          width: width!,
          beforeDiscount: specialOfferItemDatas[i]["item"].oldPrice,
          afterDicount: specialOfferItemDatas[i]["item"].price,
          discount: specialOfferItemDatas[i]["item"].discount,
          specialOfferImage: specialOfferItemDatas[i]["item"].image,
          specialOfferTitle: specialOfferItemDatas[i]["item"].title,
          imagePadding: 5);
    }
    return Text("Empety");
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    getData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpecialOfferHeader(
          width: width,
          topMargin: topMargin,
          marginTop: marginTop,
          semtricMargin: semtricMargin,
          shadowWidth: shadowWidth,
          shadowHeight: shadowHeight,
          title: "Special Offers",
        ),
        device == DeviceType.Mobile
            ? Wrap(
                spacing: space,
                runSpacing: space,
                children: [
                  SpecialOfferItem(
                      gridCount: 2,
                      heightValue: 0.40,
                      widthValue: 0.5,
                      index: specialOfferItemDatas[0]["index"],
                      aspectRatio: specialOfferItemDatas[0]["aspectRatio"],
                      height: specialOfferItemDatas[0]["height"],
                      itemList: specialOfferItemDatas[0]["item-list"],
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: specialOfferItemDatas[0]["item"].price!,
                      afterDicount: specialOfferItemDatas[0]["item"].price!,
                      discount: specialOfferItemDatas[0]["item"].discount!,
                      specialOfferImage:
                          specialOfferItemDatas[0]["item"].image!,
                      specialOfferTitle:
                          specialOfferItemDatas[0]["item"].title!,
                      imagePadding: 5),
                  SpecialOfferItem(
                      gridCount: 2,
                      heightValue: 0.40,
                      widthValue: 0.5,
                      index: specialOfferItemDatas[1]["index"],
                      aspectRatio: specialOfferItemDatas[1]["aspectRatio"],
                      height: specialOfferItemDatas[1]["height"],
                      itemList: specialOfferItemDatas[1]["item-list"],
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: specialOfferItemDatas[1]["item"].price!,
                      afterDicount: specialOfferItemDatas[1]["item"].price!,
                      discount: specialOfferItemDatas[1]["item"].discount!,
                      specialOfferImage:
                          specialOfferItemDatas[1]["item"].image!,
                      specialOfferTitle:
                          specialOfferItemDatas[1]["item"].title!,
                      imagePadding: 5),
                  SpecialOfferItem(
                      gridCount: 2,
                      heightValue: 0.60,
                      widthValue: 0.60,
                      index: specialOfferItemDatas[2]["index"],
                      aspectRatio: specialOfferItemDatas[2]["aspectRatio"],
                      height: specialOfferItemDatas[2]["height"],
                      itemList: specialOfferItemDatas[2]["item-list"],
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: specialOfferItemDatas[2]["item"].price!,
                      afterDicount: specialOfferItemDatas[2]["item"].price!,
                      discount: specialOfferItemDatas[2]["item"].discount!,
                      specialOfferImage:
                          specialOfferItemDatas[2]["item"].image!,
                      specialOfferTitle:
                          specialOfferItemDatas[2]["item"].title!,
                      imagePadding: 5),
                  SizedBox(
                    height: width! * 0.60,
                    width: brandGrid(2, 0.40),
                    child: Column(children: [
                      Expanded(
                        child: SpecialOfferItem(
                            gridCount: 0,
                            heightValue: double.infinity,
                            widthValue: double.infinity,
                            mainPadding: mainPadding!,
                            width: width!,
                            index: specialOfferItemDatas[3]["index"],
                            aspectRatio: specialOfferItemDatas[3]
                                ["aspectRatio"],
                            height: specialOfferItemDatas[3]["height"],
                            itemList: specialOfferItemDatas[3]["item-list"],
                            beforeDiscount:
                                specialOfferItemDatas[3]["item"].price!,
                            afterDicount:
                                specialOfferItemDatas[3]["item"].price!,
                            discount:
                                specialOfferItemDatas[3]["item"].discount!,
                            specialOfferImage:
                                specialOfferItemDatas[3]["item"].image!,
                            specialOfferTitle:
                                specialOfferItemDatas[3]["item"].title!,
                            imagePadding: 0),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: SpecialOfferItem(
                            gridCount: 0,
                            heightValue: double.infinity,
                            widthValue: double.infinity,
                            mainPadding: mainPadding!,
                            index: specialOfferItemDatas[4]["index"],
                            aspectRatio: specialOfferItemDatas[4]
                                ["aspectRatio"],
                            height: specialOfferItemDatas[4]["height"],
                            itemList: specialOfferItemDatas[4]["item-list"],
                            width: width!,
                            beforeDiscount:
                                specialOfferItemDatas[4]["item"].price!,
                            afterDicount:
                                specialOfferItemDatas[4]["item"].price!,
                            discount:
                                specialOfferItemDatas[4]["item"].discount!,
                            specialOfferImage:
                                specialOfferItemDatas[4]["item"].image!,
                            specialOfferTitle:
                                specialOfferItemDatas[4]["item"].title!,
                            imagePadding: 0),
                      )
                    ]),
                  )
                ],
              )
            : SpecialOfferNoMobile(
                imagePadding: 5,
                width: width,
              )
      ],
    );
  }
}

class SpecialOfferNoMobile extends StatelessWidget {
  SpecialOfferNoMobile({
    Key? key,
    this.width,
    this.imagePadding,
  }) : super(key: key);
  final double? width, imagePadding;
  @override
  Widget build(BuildContext context) {
    getDevice(width);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 150,
      ),
      child: SizedBox(
        height: width! / 5.1,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                5,
                (index) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        maxHeight: 18, maxWidth: 40),
                                    child: SizedBox(
                                      width: width! / 9,
                                      height: width! / 20,
                                      child: CustomPaint(
                                        painter: const DiscountChip(
                                            DiscountChipColor: Color.fromRGBO(
                                                222, 53, 59, 0.7)),
                                        child: Center(
                                          child: Text(
                                            specialOfferItemDatas[index]["item"]
                                                .discount!,
                                            style: const TextStyle(
                                                color: Color(0xFFffffff)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.all(imagePadding!),
                                        child: Image.asset(
                                          specialOfferItemDatas[index]["item"]
                                              .image!,
                                        ),
                                      )),
                                ),
                                Text(
                                  specialOfferItemDatas[index]["item"].title!,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(width! / 120),
                                  child: RichText(
                                      maxLines: 1,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: specialOfferItemDatas[index]
                                                    ["item"]
                                                .price!,
                                            style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 13,
                                            )),
                                        TextSpan(
                                            text: specialOfferItemDatas[index]
                                                    ["item"]
                                                .oldPrice!,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13.5)),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width! / 28)
                        ],
                      ),
                    ))),
      ),
    );
  }
}

class SpecialOfferItemData {
  SpecialOfferItemData(
      {this.imageSize,
      this.beforeDiscount,
      this.afterDicount,
      this.discount,
      this.specialOfferImage,
      this.specialOfferTitle});
  final String? beforeDiscount,
      afterDicount,
      discount,
      imageSize,
      specialOfferImage,
      specialOfferTitle;
}

List special = [];



/*

EdgeInsets.only(
                      right: mainPadding, left: mainPadding, top: 115),
*/