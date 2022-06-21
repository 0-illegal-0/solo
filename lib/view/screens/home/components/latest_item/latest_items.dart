import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/models/latest_item_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/view_item.dart';

class LatestItems extends StatelessWidget {
  LatestItems(
      {Key? key,
      this.width,
      this.mainPadding,
      this.space,
      this.title,
      this.aspectRatio,
      this.viewitemCount,
      this.height})
      : super(key: key);
  final double? width;
  final double? mainPadding, space, aspectRatio, height;
  final String? title;
  int? itemIndex;
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
    return (latestItems.length / (viewitemCount!)).ceil();
  }

  int listIndex(int? index2) {
    if (index2 == wrapCount - 1 && latestItems.length > viewitemCount!) {
      return latestItems.length % viewitemCount!;
    } else if (latestItems.length < viewitemCount!) {
      return latestItems.length;
    } else {
      return viewitemCount!;
    }
  }

  int get widthVal {
    if (latestItems.length / 5 <= 1) {
      return 1;
    } else {
      return (latestItems.length / 5).ceil();
    }
    ;
  }

  Widget build(BuildContext context) {
    getDevice(width);
    getDataToLatestItems();
    /* SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatio!,
        itemList: latestItems,
        mainPadding: mainPadding,
        width: width);*/
    MoveSlider controller =
        Get.put(MoveSlider(itemsList: latestItems, width: width));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: device == DeviceType.Mobile
              ? Theme.of(context).textTheme.headline6
              : const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        device == DeviceType.Mobile
            ? SizedBox(
                height: 300,
                width: double.infinity,
                child: SizedBox(
                  width: width! * widthVal,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: List.generate(
                        wrapCount,
                        (index1) => GetBuilder<MoveSlider>(builder: (context) {
                              return AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                left: width! * index1.toDouble() +
                                    controller.moveUnit,
                                child: Container(
                                    width: width! / 1.09,
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      spacing: space!,
                                      runSpacing: space!,
                                      children: List.generate(
                                          listIndex(
                                            index1,
                                          ), (index) {
                                        itemIndex =
                                            index + index1 * viewitemCount!;
                                        return InkWell(
                                          onTap: () {
                                            Get.to(
                                                () => ViewDetails(
                                                      width: width!,
                                                      aspectRatio: latestItems[
                                                              itemIndex!]
                                                          ["aspectRatio"],
                                                      height: latestItems[
                                                          itemIndex!]["height"],
                                                      itemList: latestItems[
                                                              itemIndex!]
                                                          ["item-list"],
                                                      index: latestItems[
                                                          itemIndex!]["index"],
                                                      numberOfRows: 1,
                                                      title: "Customer  Viewed",
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
                                                        latestItems[itemIndex!]
                                                                ["item"]
                                                            .image!)),
                                                Text(
                                                  latestItems[itemIndex!]
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
                                                    latestItems[itemIndex!]
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
                              );
                            })),
                  ),
                ),
              )
            : LatestItemNoMobile(
                itemList: latestItems,
                aspectRatio: aspectRatio,
                mainPadding: mainPadding,
                width: width,
                height: height,
                numberOfRows: 2),
        ArrowWidget(
          controller: controller,
          itemLength: latestItems,
        )
      ],
    );
  }
}

class LatestItemNoMobile extends StatelessWidget {
  LatestItemNoMobile(
      {Key? key,
      this.itemList,
      this.width,
      this.mainPadding,
      this.aspectRatio,
      this.title,
      this.numberOfRows,
      this.height})
      : super(key: key);
  final List? itemList;
  List values = [];
  final double? width, mainPadding, aspectRatio, height;
  final String? title;
  final int? numberOfRows;
  @override
  getListvalues() {
    for (var item in itemList!) {
      values.add(item["item"]);
    }
  }

  Widget build(BuildContext context) {
    getListvalues();
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatio!,
        itemList: itemList,
        mainPadding: mainPadding,
        width: width);

    MoveSlider controller =
        Get.put(MoveSlider(itemsList: itemList, width: width));
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: instanceSizes.stackHeight,
        child: Stack(
            children: List.generate(
          instanceSizes.wrapCount,
          (index) => GetBuilder<MoveSlider>(builder: (context) {
            return AnimatedPositioned(
                left: width! * index.toDouble() + controller.moveUnit,
                duration: const Duration(milliseconds: 500),
                child: AnimatedPosition2(
                  crossAxisCount: SizesData.crossAxisCount,
                  width: width,
                  numberOfRows: numberOfRows!,
                  itemList: values,
                  mainPadding: mainPadding,
                  index2: index,
                  wrapCount: instanceSizes.wrapCount,
                  aspectRatio: aspectRatio,
                  gridWidth: instanceSizes.gridWidth,
                  space: instanceSizes.space,
                  height: height,
                ));
          }),
        )),
      ),
    ]);
  }
}
