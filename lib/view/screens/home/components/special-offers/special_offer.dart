import 'package:flutter/material.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_header.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer_item.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({Key? key, this.width, this.mainPadding})
      : super(key: key);
  final double? width;
  final double? mainPadding;
  final double shadowWidth = 40;
  final double shadowHeight = 15;
  double get marginTop {
    return width! / 7.2;
  }

  double get space {
    return width! / 36;
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Wrap(
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
                specialOfferImage: "assets/images/laptops/Dell Vostro.jpg",
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
                specialOfferImage: "assets/images/laptops/laptop-asus2.jpg",
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
                      specialOfferImage: "assets/images/cameras/nikon.jpg",
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
      ],
    );
  }
}
