import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/style.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/left_side_element.dart';
import 'package:solo/view/widget/view_item.dart';
import '../responsive.dart';
import 'navigation_bar.dart';

class ShowItemWrap extends StatelessWidget {
  ShowItemWrap({
    Key? key,
    this.data,
  }) {
    argumentData = Get.arguments;
    data = argumentData!["data"];
  }

  Map? argumentData;
  List? data;
  double? widthValue;
  int? itemCount;

  static double? brandGrid, containerHeight, imageHeight;
  crossAxisCount(width) {
    getItem();
    if (device == DeviceType.Tablet) {
      if (width! < 800) {
        widthValue = 3.53;
        itemCount = 3;
      } else {
        widthValue = 4.85;
        itemCount = 4;
      }
    } else {
      widthValue = 6.25;
      itemCount = 5;
    }
  }

  List finalData = [];
  getItem() {
    for (var item in data!) {
      finalData.add(item["item"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double space = width / 36;
    getDevice(width);
    crossAxisCount(width);
    return Scaffold(
        backgroundColor: const Color(0xFFe1e1e3),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  SizedBox(
                      height: device == DeviceType.Mobile
                          ? 115
                          : device == DeviceType.Tablet
                              ? 155
                              : 140),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(argumentData!["title"], style: titleStyle),
                  ),
                  device != DeviceType.Mobile
                      ? Wrap(
                          spacing: space,
                          runSpacing: space,
                          children: List.generate(data!.length, (index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFFb1b3b5),
                                        blurRadius: 10,
                                        spreadRadius: 0.1,
                                        offset: Offset(0, 0))
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              constraints: BoxConstraints(
                                  maxHeight: SizesData.maxHeight,
                                  minHeight: SizesData.minHeight),
                              width: width / widthValue!,
                              child: AspectRatio(
                                  aspectRatio: argumentData!["aspectRatio"],
                                  child: ViewItemContent(
                                    index: index,
                                    itemList: finalData,
                                    aspectRatio: argumentData!["aspectRatio"],
                                    width: width,
                                    height: width * 0.50,
                                    productItem: data![index]["product-index"],
                                  )),
                            );
                          }),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: LeftSideElement(
                            title: argumentData!["title"],
                            width: width,
                            itemCountForTablet: 2,
                            mainPadding: width / 24,
                            itemCountForDesktop: 3,
                            space: 10,
                            data: data,
                          ),
                        ),
                  const SizedBox(height: 20),
                  Close(width: width),
                ],
              ),
            )),
            Head(width: width),
            const BottomRow(),
          ],
        ));
  }
}
