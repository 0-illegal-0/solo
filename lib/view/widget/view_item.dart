import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/note.dart';

class ArrowWidget extends StatelessWidget {
  ArrowWidget({Key? key, this.controller, this.itemLength}) : super(key: key);
  dynamic controller;
  final List? itemLength;
  @override
  Widget build(BuildContext context) {
    return itemLength!.length > SizesData.crossAxisCount * 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: controller.moveBack,
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                  )),
              IconButton(
                onPressed: controller.moveNext,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}

class MobileDesign extends StatelessWidget {
  const MobileDesign(
      {Key? key,
      this.title,
      this.height,
      this.aspectRatio,
      this.width,
      this.itemCount,
      this.itemList})
      : super(key: key);

  final String? title;
  final double? height, aspectRatio, width;
  final int? itemCount;
  final List? itemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
            constraints: const BoxConstraints(maxHeight: 230),
            height: height,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Card(
                    child: AspectRatio(
                        aspectRatio: aspectRatio!,
                        child: ViewItemContent(
                          itemList: itemList,
                          index: index,
                          width: width,
                          aspectRatio: aspectRatio,
                          height: height,
                        )),
                  );
                })),
      ],
    );
  }
}

class AnimatedPosition2 extends StatelessWidget {
  const AnimatedPosition2(
      {Key? key,
      this.width,
      this.crossAxisCount,
      this.itemList,
      this.mainPadding,
      this.index2,
      this.aspectRatio,
      this.wrapCount,
      this.space,
      this.gridWidth,
      this.height,
      this.numberOfRows})
      : super(key: key);

  final double? width, mainPadding, aspectRatio, space, gridWidth, height;
  final int? crossAxisCount, index2, wrapCount, numberOfRows;
  final List? itemList;

  int get listIndex {
    if (index2 == wrapCount! - 1 &&
        itemList!.length > crossAxisCount! * numberOfRows!) {
      if (itemList!.length % (crossAxisCount! * numberOfRows!) == 0) {
        return crossAxisCount! * numberOfRows!;
      } else {
        return itemList!.length % (crossAxisCount! * numberOfRows!);
      }
    } else if (itemList!.length < crossAxisCount! * numberOfRows!) {
      return itemList!.length;
    } else {
      return crossAxisCount! * numberOfRows!;
    }
  }

  int get stageNumber {
    return index2! * (crossAxisCount! * numberOfRows!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Wrap(
        spacing: space!,
        runSpacing: space!,
        children: List.generate(
            listIndex,
            (index) => Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFb1b3b5),
                            blurRadius: 10,
                            spreadRadius: 0.1,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  constraints: BoxConstraints(
                      maxHeight: SizesData.maxHeight,
                      minHeight: SizesData.minHeight),
                  width: gridWidth!,
                  child: AspectRatio(
                      aspectRatio: aspectRatio!,
                      child: ViewItemContent(
                        index: index + stageNumber,
                        itemList: itemList,
                        aspectRatio: aspectRatio,
                        width: width,
                        height: height!,
                      )),
                )),
      ),
    );
  }
}

class ViewItemContent extends StatelessWidget {
  const ViewItemContent(
      {Key? key,
      this.itemList,
      this.index,
      this.width,
      this.aspectRatio,
      this.height})
      : super(key: key);
  final List? itemList;
  final int? index;
  final double? width, aspectRatio, height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(width! / 45 > 20 ? 20 : width! / 45),
                child: Image.asset(itemList![index!].image!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                itemList![index!].description!,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                    children: List.generate(
                        5,
                        (index) => Icon(Icons.star_rate,
                            size: 17,
                            color: index > 2 ? Colors.grey : Colors.cyan)))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      itemList![index!].price!,
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: IconButton(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 3, bottom: 3),
                    color: Colors.green,
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      note(context);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        onTap: () {
          Get.to(
              () => ViewDetails(
                    width: width!,
                    aspectRatio: aspectRatio,
                    height: height,
                    itemList: itemList,
                    index: index,
                    numberOfRows: 1,
                    title: "Customer  Viewed",
                  ),
              preventDuplicates: false);
          Get.deleteAll();
        });
  }
}

class SizesData {
  SizesData({
    this.numberOfRows,
    this.itemList,
    this.width,
    this.mainPadding,
    this.aspectRatio,
  });
  List? itemList;
  final double? width, mainPadding, aspectRatio;
  final int? numberOfRows;
  static double maxHeight = 240;
  static double minHeight = 210;

  static int get crossAxisCount {
    if (device == DeviceType.Tablet) {
      return 4;
    } else {
      return 5;
    }
  }

  int get wrapCount {
    return (itemList!.length / (crossAxisCount * 2)).ceil();
  }

  double get space {
    return width! / 36;
  }

  double get gridWidth {
    return (((width! - mainPadding! * 2 - space * (crossAxisCount - 1))) /
            crossAxisCount) -
        0.05;
  }

  double get height {
    if (gridWidth / aspectRatio! > maxHeight) {
      return maxHeight;
    } else if (gridWidth / aspectRatio! < minHeight) {
      return minHeight;
    } else {
      return gridWidth / aspectRatio!;
    }
  }

  double get stackHeight {
    if (itemList!.length > crossAxisCount) {
      return height * 2 + space + 20;
    } else {
      return height + 20;
    }
  }
}
