import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

class SpecialOfferItem extends StatelessWidget {
  SpecialOfferItem(
      {Key? key,
      required this.width,
      required this.mainPadding,
      this.discount,
      this.specialOfferImage,
      this.specialOfferTitle,
      this.beforeDiscount,
      this.afterDicount,
      this.imagePadding,
      this.aspectRatio,
      this.height,
      this.index,
      this.itemList,
      this.loopIndex,
      this.productItem})
      : super(key: key);
  final double width;
  final double mainPadding;
  final String? discount;
  final String? specialOfferImage;
  final String? specialOfferTitle;
  final String? beforeDiscount;
  final String? afterDicount;
  final double? aspectRatio, height;
  final int? index, loopIndex, productItem;
  final List? itemList;
  final double? imagePadding;
  double? heightValue, widthValue;

  static const BoxDecoration specialOfferDecoration = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Color(0xFFc2c2c2),
        blurRadius: 10,
        spreadRadius: 0.1,
        offset: Offset(0, 5))
  ], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)));

  sizes(index) {
    widthValue = index < 2
        ? 2.27
        : index < 3
            ? 1.9
            : 2.8;
    heightValue = index < 2
        ? 0.4
        : index < 3
            ? 0.6
            : 0.6;
  }

  @override
  Widget build(BuildContext context) {
    sizes(loopIndex);
    return InkWell(
      onTap: () {
        Get.toNamed('/view-details',
            arguments: {
              "width": width,
              "data-list": itemList,
              "index": index,
              "product-index": productItem,
              "aspect-ratio": aspectRatio,
              "height": height
            },
            preventDuplicates: false);
        Get.deleteAll();
      },
      child: Container(
          height: width * heightValue!,
          width: width / widthValue!,
          decoration: specialOfferDecoration,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 18, maxWidth: 40),
                  child: SizedBox(
                    width: width / 9,
                    height: width / 20,
                    child: CustomPaint(
                      painter: const DiscountChip(
                          discountChipColor: Color.fromRGBO(222, 53, 59, 0.7)),
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
                      child: Image.asset(specialOfferImage!),
                    )),
              ),
              Text(specialOfferTitle!, maxLines: 1),
              Padding(
                  padding: EdgeInsets.all(width / 120),
                  child: Text("$afterDicount! EGP",
                      maxLines: 1,
                      style:
                          const TextStyle(color: Colors.blue, fontSize: 13.5))),
            ],
          )),
    );
  }
}

class DiscountChip extends CustomPainter {
  const DiscountChip({required this.discountChipColor});
  final Color discountChipColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = discountChipColor;
    paint.style = PaintingStyle.fill;

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
