import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/view_item.dart';

import '../../../../style.dart';

class LatestItems extends StatelessWidget {
  LatestItems(
      {Key? key,
      this.width,
      this.mainPadding,
      this.space,
      this.title,
      this.aspectRatio,
      this.viewitemCount,
      this.height,
      this.data,
      this.numberOfRows,
      this.id})
      : super(key: key) {
    getDevice(width);
    getListvalues();
  }

  final double? width;
  final double? mainPadding, space, aspectRatio, height;
  final String? title;
  int? itemIndex;
  final List? data;
  final int? viewitemCount, numberOfRows, id;
  static const showMobileItemCount = 5;

  int get wrapCount {
    return (data!.length / (viewitemCount!)).ceil();
  }

  int listIndex2(index) {
    if (index == wrapCount - 1 && data!.length > viewitemCount!) {
      if (data!.length % viewitemCount! == 0) {
        return viewitemCount!;
      } else {
        return data!.length % viewitemCount!;
      }
    } else if (data!.length < viewitemCount!) {
      return data!.length;
    } else {
      return viewitemCount!;
    }
  }

  int get widthVal {
    if (data!.length / showMobileItemCount <= 1) {
      return 1;
    } else {
      return (data!.length / showMobileItemCount).ceil();
    }
  }

  List? values = [];

  getListvalues() {
    for (var item in data!) {
      values!.add(item["item"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    MoveSliderMain controller =
        Get.put(MoveSliderMain(itemsList: data!, width: width));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        device == DeviceType.Mobile
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(title!, style: titleStyle),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: SizedBox(
                      width: width! * widthVal,
                      child: GetBuilder<MoveSliderMain>(builder: (context) {
                        return Stack(
                          alignment: AlignmentDirectional.center,
                          children: List.generate(
                              wrapCount,
                              (index1) => AnimatedPositioned(
                                    duration: const Duration(milliseconds: 500),
                                    left: width! * index1.toDouble() +
                                        controller.moveUnit[8],
                                    child: Container(
                                        width: width! / 1.09,
                                        alignment: Alignment.center,
                                        child: Wrap(
                                          spacing: space!,
                                          runSpacing: space!,
                                          children: List.generate(
                                              listIndex2(
                                                index1,
                                              ), (index) {
                                            itemIndex =
                                                index + index1 * viewitemCount!;
                                            return InkWell(
                                              onTap: () {
                                                int? finalFndex = index +
                                                    index1 * viewitemCount!;
                                                Get.toNamed('/view-details',
                                                    arguments: {
                                                      "width": width,
                                                      "data-list":
                                                          data![finalFndex]
                                                              ["item-list"],
                                                      "index": data![finalFndex]
                                                          ["index"],
                                                      "product-index":
                                                          data![finalFndex]
                                                              ["product-index"],
                                                      "aspect-ratio":
                                                          data![finalFndex]
                                                              ["aspectRatio"],
                                                      "height":
                                                          data![finalFndex]
                                                              ["height"]
                                                    },
                                                    preventDuplicates: false);
                                                Get.deleteAll();
                                              },
                                              child: Container(
                                                width: index < 2
                                                    ? width! / 2.29
                                                    : width! / 3.42,
                                                height: 140,
                                                decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                              Color(0xFFc2c2c2),
                                                          blurRadius: 5,
                                                          spreadRadius: 1,
                                                          offset:
                                                              Offset(0, 0.5))
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                padding: EdgeInsets.only(
                                                    top: width! / 36,
                                                    right: width! / 36,
                                                    left: width! / 36,
                                                    bottom: width! / 72),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        child: Image.asset(
                                                            data![itemIndex!]
                                                                    ["item"]
                                                                .image!)),
                                                    Text(
                                                      data![itemIndex!]["item"]
                                                          .title!,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Text(
                                                        "${data![itemIndex!]["item"].price!} EGP",
                                                        maxLines: 1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        )),
                                  )),
                        );
                      }),
                    ),
                  ),
                  ArrowWidget(
                      controller: controller,
                      itemLength: values,
                      id: id,
                      crossAxisCount: 2.5.ceil(),
                      wrapCount: wrapCount)
                ],
              )
            : ViewItem(
                height: height,
                itemList: values,
                mainPadding: mainPadding!,
                title: title!,
                numberOfRows: numberOfRows,
                aspectRatioNoMobile: aspectRatio,
                width: width!,
                id: id,
                aspectRatioMobile: aspectRatio,
              ),
      ],
    );
  }
}
