import 'package:flutter/material.dart';
import 'package:solo/controllers/view_details_controller.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/bottom_sheet.dart';
import 'package:solo/view/screens/view-details/information_design.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      this.fontTitle,
      this.controller,
      this.product,
      this.width,
      this.index,
      this.productIndex})
      : super(key: key);
  final double? fontTitle, width;
  final ImageSlider? controller;
  final Products? product;
  final int? index, productIndex;

  Color get detailsColor {
    return device == DeviceType.Desktop
        ? const Color(0xFFe6e6fa)
        : const Color(0xFFffffff);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: detailsColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product!.price!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text(
                              product!.oldPrice!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        Text(
                          product!.discount!,
                          textAlign: device == DeviceType.Desktop
                              ? TextAlign.left
                              : TextAlign.right,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: detailsColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Brand",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          product!.productBrands!,
                          textAlign: device == DeviceType.Desktop
                              ? TextAlign.left
                              : TextAlign.right,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: detailsColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rating",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star_rate,
                                    size: 17.0,
                                    color: index > 2
                                        ? Colors.grey
                                        : Colors.cyan))),
                        const Text(
                          "9 verified ratings",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (device == DeviceType.Desktop) || width! >= 800
                ? const Expanded(
                    child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Warranty(),
                  ))
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 15),
        (width! < 800)
            ? SizedBox(width: width, child: const Warranty())
            : const SizedBox(),
        (device == DeviceType.Tablet)
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 176, 66, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Delivery(width: width),
                      Column(
                        children: [
                          SizedBox(
                            height: 66,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChargeButton(
                                    title: "Add To Cart",
                                    image: product!.image,
                                    price: product!.price,
                                    stars: product!.stars,
                                    itemTitle: product!.title,
                                    width: width,
                                    itemIndex: index,
                                    productItem: productIndex),
                                const SizedBox(height: 8),
                                ChargeButton(title: "Buy Now", width: width)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(height: device == DeviceType.Desktop ? 0 : 15),
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          color: const Color(0xFFffffff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Product Informations",
                  style: TextStyle(
                      fontSize: fontTitle, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 3, top: 5),
                child: Text(
                  "Highlights",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InformationDesign(
                  width: width,
                  manualWidth: false,
                  itemWidth: double.infinity,
                  keys: controller!.highlightsKeys,
                  values: controller!.highlightsValues),
              device == DeviceType.Desktop
                  ? const SizedBox()
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        color: const Color(0xFFe6e6fa),
                        height: 40,
                        width: width == 360 ? 360 : 200,
                        child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 0))),
                            onPressed: () {
                              bottomSheet(
                                context,
                                title: "Specifications",
                                sheetWidget: InformationDesign(
                                  width: width,
                                  manualWidth: false,
                                  keys: controller!.specificationsKeys,
                                  values: controller!.specificationsValues,
                                ),
                              );
                            },
                            child: Text("More Information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: fontTitle,
                                    fontWeight: FontWeight.bold))),
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }
}

class Warranty extends StatelessWidget {
  const Warranty({
    Key? key,
    this.fontSize,
  }) : super(key: key);
  final dynamic fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFe6e6fa),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Warranty: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Expanded(
                child: Text("1 year warranty", style: TextStyle(fontSize: 14)),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Return Policy: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Expanded(
                  child: Text("Return products for free within 7 days",
                      style: TextStyle(fontSize: 14)))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Delivery: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  "Order available for delivery in 19 May",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Center: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  "Available for delivery at any time",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
