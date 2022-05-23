import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/widget/view_item.dart';

class TelevisionsView extends StatelessWidget {
  TelevisionsView(
      {this.width,
      this.height,
      this.itemCount,
      this.title,
      this.itemList,
      this.aspectRatioMobile,
      this.mainPadding,
      this.aspectRatioNoMobile,
      this.numberOfRows});

  final double? width, mainPadding, aspectRatioMobile, aspectRatioNoMobile;
  final double? height;
  final int? itemCount, numberOfRows;
  final String? title;
  final List? itemList;
  int get crossAxisCount {
    if (device == DeviceType.Tablet) {
      return 4;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    return device == DeviceType.Mobile
        ? MobileDesign(
            aspectRatio: aspectRatioMobile,
            height: height,
            itemCount: itemCount,
            itemList: itemList,
            title: title,
            width: width,
          )
        : TelevisionItems(
            itemList: itemList,
            title: title,
            width: width,
            height: height,
            numberOfRows: numberOfRows,
            mainPadding: mainPadding,
            aspectRatio: aspectRatioNoMobile,
          );
  }
}

class TelevisionsViewController extends MoveSliderMain {
  TelevisionsViewController({this.itemsList, this.width});
  double? width;
  List? itemsList;
}

class TelevisionItems extends StatelessWidget {
  TelevisionItems(
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
  final double? width, mainPadding, aspectRatio, height;
  final String? title;
  final int? numberOfRows;
  @override
  Widget build(BuildContext context) {
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatio!,
        itemList: itemList,
        mainPadding: mainPadding,
        width: width);
    TelevisionsViewController controller =
        Get.put(TelevisionsViewController(itemsList: itemList, width: width));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: Theme.of(context).textTheme.headline6),
        ),
        SizedBox(
          height: instanceSizes.stackHeight,
          child: Stack(
              children: List.generate(
            instanceSizes.wrapCount,
            (index) =>
                GetBuilder<TelevisionsViewController>(builder: (context) {
              return AnimatedPositioned(
                  left: width! * index.toDouble() + controller.moveUnit,
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
        ArrowWidget(
          controller: controller,
          itemLength: itemList,
        )
      ],
    );
  }
}
