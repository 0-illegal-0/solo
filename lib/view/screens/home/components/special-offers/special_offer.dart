import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    for (var i = 0; i < SpecialOfferItemDatas.length - 2; i++) {
      if (SpecialOfferItemDatas[i].imageSize == "large") {
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
          beforeDiscount: SpecialOfferItemDatas[i].beforeDiscount,
          afterDicount: SpecialOfferItemDatas[i].afterDicount,
          discount: SpecialOfferItemDatas[i].discount,
          specialOfferImage: SpecialOfferItemDatas[i].specialOfferImage,
          specialOfferTitle: SpecialOfferItemDatas[i].specialOfferTitle,
          imagePadding: 5);
    }
    return Text("Empety");
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
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
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: "20.200 ",
                      afterDicount: "18584 EGP",
                      discount: "15 ",
                      specialOfferImage:
                          "assets/images/laptops/Dell Vostro.jpg",
                      specialOfferTitle: "DELL Vostro 3510 ...",
                      imagePadding: 5),
                  SpecialOfferItem(
                      gridCount: 2,
                      heightValue: 0.40,
                      widthValue: 0.5,
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: "25.330 ",
                      afterDicount: "21.530 EGP",
                      discount: "15 ",
                      specialOfferImage:
                          "assets/images/laptops/laptop-asus2.jpg",
                      specialOfferTitle: "Asus FX506HEB-B ...",
                      imagePadding: 5),
                  SpecialOfferItem(
                      gridCount: 2,
                      heightValue: 0.60,
                      widthValue: 0.60,
                      mainPadding: mainPadding!,
                      width: width!,
                      beforeDiscount: "25.330 ",
                      afterDicount: "21.530 EGP",
                      discount: "15 ",
                      specialOfferImage: "assets/images/tv/led-lg-1.jpg",
                      specialOfferTitle: "LG 32LM570BPUA ...",
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
                            beforeDiscount: "25.330 ",
                            afterDicount: "21.530 EGP",
                            discount: "15 ",
                            specialOfferImage:
                                "assets/images/cameras/nikon.jpg",
                            specialOfferTitle: "Sigma Alpha",
                            imagePadding: 0),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: SpecialOfferItem(
                            gridCount: 0,
                            heightValue: double.infinity,
                            widthValue: double.infinity,
                            mainPadding: mainPadding!,
                            width: width!,
                            beforeDiscount: "25.330 ",
                            afterDicount: "21.530 EGP",
                            discount: "15 ",
                            specialOfferImage:
                                "assets/images/cameras/Sigma Alpha.jpg",
                            specialOfferTitle: "Sony Alpha 7 IV",
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
                                    constraints: BoxConstraints(
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
                                            SpecialOfferItemDatas[index]
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
                                          SpecialOfferItemDatas[index]
                                              .specialOfferImage!,
                                        ),
                                      )),
                                ),
                                Text(
                                  SpecialOfferItemDatas[index]
                                      .specialOfferTitle!,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ), //"DELL Vostro 3510 ..."
                                Padding(
                                  padding: EdgeInsets.all(width! / 120),
                                  child: RichText(
                                      maxLines: 1,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: SpecialOfferItemDatas[index]
                                                .beforeDiscount!, //"20.200 "
                                            style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 13,
                                            )),
                                        TextSpan(
                                            text: SpecialOfferItemDatas[index]
                                                .afterDicount!, //"18584 EGP"
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13.5)),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width! / 28,
                          )
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

List<SpecialOfferItemData> SpecialOfferItemDatas = [
  SpecialOfferItemData(
    beforeDiscount: "20.200 ",
    afterDicount: "18584 EGP",
    discount: "15 ",
    imageSize: "medium",
    specialOfferImage: "assets/images/laptops/Dell Vostro.jpg",
    specialOfferTitle: "DELL Vostro 3510 ...",
  ),
  SpecialOfferItemData(
    beforeDiscount: "25.330 ",
    afterDicount: "21.530 EGP",
    discount: "15 ",
    imageSize: "medium",
    specialOfferImage: "assets/images/laptops/laptop-asus2.jpg",
    specialOfferTitle: "Asus FX506HEB-B ...",
  ),
  SpecialOfferItemData(
    beforeDiscount: "25.330 ",
    afterDicount: "21.530 EGP",
    discount: "15 ",
    imageSize: "large",
    specialOfferImage: "assets/images/tv/led-lg-1.jpg",
    specialOfferTitle: "LG 32LM570BPUA ...",
  ),
  SpecialOfferItemData(
    beforeDiscount: "25.330 ",
    afterDicount: "21.530 EGP",
    discount: "15 ",
    specialOfferImage: "assets/images/cameras/nikon.jpg",
    specialOfferTitle: "Sigma Alpha",
  ),
  SpecialOfferItemData(
    beforeDiscount: "25.330 ",
    afterDicount: "21.530 EGP",
    discount: "15 ",
    specialOfferImage: "assets/images/cameras/Sigma Alpha.jpg",
    specialOfferTitle: "Sony Alpha 7 IV",
  ),
];
