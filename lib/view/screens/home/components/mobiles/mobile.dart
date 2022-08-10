import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/widget/view_item.dart';

import '../../../../style.dart';
/*
class MobileView extends StatelessWidget {
  const MobileView(
      {this.width,
      this.height,
      this.itemCount,
      this.title,
      this.itemList,
      this.i,
      this.aspectRatioMobile,
      this.mainPadding,
      this.aspectRatioNoMobile,
      this.numberOfRows});

  final double? width,
      height,
      mainPadding,
      aspectRatioMobile,
      aspectRatioNoMobile;
  final int? itemCount, numberOfRows, i;
  final String? title;
  final List? itemList;
  @override
  Widget build(BuildContext context) {
    getDevice(width);
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatioNoMobile!,
        itemList: itemList,
        mainPadding: mainPadding,
        width: width);
    return device == DeviceType.Mobile
        ? MobileDesign(
            aspectRatio: aspectRatioMobile,
            height: height,
            itemCount: itemCount,
            itemList: itemList,
            title: title,
            width: width,
          )
        : AnimatedPosition2(
            itemList: itemList,
            title: title,
            width: width,
            height: height,
            i: i!,
            numberOfRows: numberOfRows,
            mainPadding: mainPadding,
            aspectRatio: aspectRatioNoMobile,
            crossAxisCount: SizesData.crossAxisCount,
            wrapCount: instanceSizes.wrapCount,
            stackHeight: instanceSizes.stackHeight,
            space: instanceSizes.space,
            gridWidth: instanceSizes.gridWidth,
          );
  }
}*/
/*
class MobileItems extends StatelessWidget {
  const MobileItems({
    Key? key,
    this.itemList,
    this.i,
    this.width,
    this.mainPadding,
    this.aspectRatio,
    this.title,
    this.numberOfRows,
    this.height,
  }) : super(key: key);
  final List? itemList;
  final double? width, mainPadding, aspectRatio, height;
  final String? title;
  final int? numberOfRows, i;
  @override
  Widget build(BuildContext context) {
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatio!,
        itemList: itemList,
        mainPadding: mainPadding,
        width: width);
    MoveSliderMain controller = Get.put(MoveSliderMain(
        itemsList: itemList,
        width: width,
        crossAxisCount: SizesData.crossAxisCount,
        numberOfRows: numberOfRows));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        SizedBox(
          height: instanceSizes.stackHeight,
          child: Stack(
              children: List.generate(
            instanceSizes.wrapCount,
            (index) => GetBuilder<MoveSliderMain>(builder: (context) {
              return AnimatedPositioned(
                  left: width! * index.toDouble() + controller.moveUnit[i!],
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedPosition2(
                    crossAxisCount: SizesData.crossAxisCount,
                    width: width,
                    numberOfRows: numberOfRows!,
                    itemList: itemList,
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
        ArrowWidget(controller: controller, itemLength: itemList, i: i)
      ],
    );
  }
}
*/