import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/models/latest_item_models.dart';
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
      this.height, this.data})
      : super(key: key);
  final double? width;
  final double? mainPadding, space, aspectRatio, height;
  final String? title;
  int? itemIndex;
  final List? data;
  final int? viewitemCount;
  @override
  double brandGrid(int? countItem) {
    return (width! -
            mainPadding! * 2 -
            width! / 72 * 2 -
            space! * (countItem! - 1)) /
        countItem;
  }

  int get wrapCount {
    return (data!.length / (viewitemCount!)).ceil();
  }

  int listIndex(int? index2) {
    if (index2 == wrapCount - 1 && data!.length > viewitemCount!) {
      return data!.length % viewitemCount!;
    } else if (data!.length < viewitemCount!) {
      return data!.length;
    } else {
      return viewitemCount!;
    }
  }

  int listIndex2(index) {
    if (index == wrapCount - 1 &&
        data!.length > viewitemCount!) {
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
    if (data!.length / 5 <= 1) {
      return 1;
    } else {
      return (data!.length / 5).ceil();
    }
  }

  List? values = [];
  getListvalues() {
    for (var item in data!) {
      values!.add(item["item"]);
    }
  }

  Widget build(BuildContext context) {
    getDevice(width);
    getDataToLatestItems();
    getListvalues();
    MoveSliderMain controller =
        Get.put(MoveSliderMain(itemsList: data!, width: width));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: titleStyle,
        ),
        device == DeviceType.Mobile
            ? Column(
              children: [
                SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: SizedBox(
                      width: width! * widthVal,
                      child: GetBuilder<MoveSliderMain>(
                        builder: (context) {
                          return Stack(
                            alignment: AlignmentDirectional.center,
                            children: List.generate(
                                wrapCount,
                                (index1) =>  AnimatedPositioned(
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

                                                    print("itemIndex  $itemIndex");
                                                    print("index  ${index + index1 * viewitemCount!}");
                                                    Get.to(
                                                        () => ViewDetails(
                                                              width: width!,
                                                              aspectRatio: data![
                                                              index + index1 * viewitemCount!]
                                                                  ["aspectRatio"],
                                                              height: data![
                                                              index + index1 * viewitemCount!]["height"],
                                                              itemList: data![
                                                              index + index1 * viewitemCount!]
                                                                  ["item-list"],
                                                              index: data![
                                                              index + index1 * viewitemCount!]["index"],
                                                              numberOfRows: 1,
                                                              title: "Customer  Viewed",
                                                          productItem: data![index + index1 * viewitemCount!]["product-index"],
                                                            ),
                                                        preventDuplicates: false);
                                                    Get.deleteAll();
                                                  },
                                                  child: Container(
                                                    width: brandGrid(index > 1 ? 3 : 2),
                                                    height: 140,
                                                    decoration: const BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color(0xFFc2c2c2),
                                                              blurRadius: 5,
                                                              spreadRadius: 1,
                                                              offset: Offset(0, 0.5))
                                                        ],
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5))),
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
                                                          data![itemIndex!]
                                                                  ["item"]
                                                              .title!,
                                                          maxLines: 2,
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  top: 15),
                                                          child: Text(
                                                            data![itemIndex!]
                                                                    ["item"]
                                                                .price!,
                                                            maxLines: 1,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            )),
                                      )
                                    ),
                          );
                        }
                      ),
                    ),
                  ),
                ArrowWidget(
                    controller: controller,
                    itemLength: values,
                    i: 8,
                    crossAxisCount: 2.5.ceil(),
                    wrapCount: wrapCount)
              ],
            )
            : ViewItem(
                height: height,
                itemList: values,
                mainPadding: mainPadding!,
                title: "",
                numberOfRows: 2,
                aspectRatioNoMobile: aspectRatio,
                width: width!,
                i: 5,
                aspectRatioMobile: aspectRatio,
              ),
      ],
    );
  }
}
