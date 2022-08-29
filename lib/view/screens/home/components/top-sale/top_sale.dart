import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

import '../../../../style.dart';

class TopSale extends StatelessWidget {
  TopSale(
      {Key? key,
      this.width,
      this.mainPadding,
      this.space,
      this.title,
      this.itemCountForTablet,
      this.itemCountForDesktop,
      this.topSale})
      : super(key: key);
  final double? width, mainPadding, space;
  final String? title;
  final List? topSale;
  final int? itemCountForTablet, itemCountForDesktop;
  double? designHeight, designWidth;

  responsiveSizes() {
    if (width! < 850) {
      designHeight = width! / 2.57 > 160 ? 160 : width! / 2.57;
      designWidth = width;
    } else if (width! < 1300) {
      designHeight = 160;
      designWidth =
          (width! - mainPadding! * 2 - space! * (itemCountForTablet! - 1)) /
              itemCountForTablet!;
    } else {
      designHeight = 160;
      designWidth =
          (width! - mainPadding! * 2 - space! * (itemCountForDesktop! - 1)) /
              itemCountForDesktop!;
    }
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    responsiveSizes();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        Wrap(
            spacing: space!,
            runSpacing: space!,
            children: List.generate(
              topSale!.length,
              (index) => Container(
                decoration:
                    const BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                  BoxShadow(
                      color: Color(0xFFbababa),
                      blurRadius: 7,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                width: designWidth!,
                height: designHeight,
                child: InkWell(
                  onTap: () {
                    Get.to(
                        () => ViewDetails(
                              width: width!,
                              aspectRatio: topSale![index]["aspectRatio"],
                              height: topSale![index]["height"],
                              itemList: topSale![index]["item-list"],
                              index: topSale![index]["index"],
                              numberOfRows: 1,
                              title: "Customer  Viewed",
                            ),
                        preventDuplicates: false);
                    Get.deleteAll();
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 5, top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          topSale![index]["item"].image,
                                          height: designHeight! * 0.50,
                                        ),
                                        Text(
                                          topSale![index]["item"].title,
                                          softWrap: false,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        const Divider(
                                          height: 0,
                                          color: Colors.grey,
                                          indent: 00,
                                          endIndent: 0,
                                          thickness: 1,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        5,
                                        (index) => Icon(Icons.star_rate,
                                            size: 17.0,
                                            color: index > 2
                                                ? Colors.grey
                                                : Colors.green))),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 5, left: 5),
                                  child: Text(
                                      topSale![index]["item"].description,
                                      maxLines: 5),
                                )),
                            const Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Divider(
                                  height: 0,
                                  color: Colors.grey,
                                  indent: 00,
                                  endIndent: 0,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "13.000 EGP",
                                    maxLines: 1,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
