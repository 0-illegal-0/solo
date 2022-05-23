import 'package:flutter/material.dart';

class SpecialOfferItem extends StatelessWidget {
  const SpecialOfferItem(
      {Key? key,
      required this.width,
      required this.mainPadding,
      this.discount,
      this.specialOfferImage,
      this.specialOfferTitle,
      this.beforeDiscount,
      this.afterDicount,
      required this.widthValue,
      required this.heightValue,
      required this.gridCount,
      this.imagePadding})
      : super(key: key);
  final double width;
  final double mainPadding;
  final String? discount;
  final String? specialOfferImage;
  final String? specialOfferTitle;
  final String? beforeDiscount;
  final String? afterDicount;
  final double widthValue;
  final double heightValue;
  final int gridCount;
  final double? imagePadding;

  double get space {
    return width / 36;
  }

  double brandGrid(int? countItem, double? boxWidth) {
    return ((width - (mainPadding * 2) - (space * (countItem! - 1))) *
            boxWidth!) -
        0.05;
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
    return Container(
        height: width * heightValue, // 0.40
        width: brandGrid(gridCount, widthValue), // 0.5 , /2
        decoration: specialOfferDecoration,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 18, maxWidth: 40), //2.222222222222222
                child: SizedBox(
                  width: width / 9,
                  height: width / 20,
                  child: CustomPaint(
                    painter: const DiscountChip(
                        DiscountChipColor: Color.fromRGBO(222, 53, 59, 0.7)),
                    child: Center(
                      child: Text(
                        discount!,
                        style: const TextStyle(color: Color(0xFFffffff)),
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
                      specialOfferImage!,
                    ),
                  )),
            ),
            Text(specialOfferTitle!, maxLines: 1), //"DELL Vostro 3510 ..."
            Padding(
              padding: EdgeInsets.all(width / 120),
              child: RichText(
                  maxLines: 1,
                  text: TextSpan(children: [
                    TextSpan(
                        text: beforeDiscount, //"20.200 "
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 13,
                        )),
                    TextSpan(
                        text: afterDicount, //"18584 EGP"
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 13.5)),
                  ])),
            ),
          ],
        ));
  }
}

class DiscountChip extends CustomPainter {
  const DiscountChip({required this.DiscountChipColor});
  final Color DiscountChipColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = DiscountChipColor; // 0xFF26a1d1   0xFFa88f32
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.lineTo(size.width * 0.80, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.80, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
