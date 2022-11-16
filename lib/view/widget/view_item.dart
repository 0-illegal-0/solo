import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/controllers/latest_item_controller.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/style.dart';

class ViewItem extends StatelessWidget {
  const ViewItem(
      {Key? key,
      this.width,
      this.height,
      this.title,
      this.itemList,
      this.id,
      this.aspectRatioMobile,
      this.mainPadding,
      this.aspectRatioNoMobile,
      this.numberOfRows,
      this.productItem})
      : super(key: key);

  final double? width,
      height,
      mainPadding,
      aspectRatioMobile,
      aspectRatioNoMobile;
  final int? numberOfRows, id, productItem;
  final String? title;
  final List? itemList;
  @override
  Widget build(BuildContext context) {
    getDevice(width);
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatioNoMobile!,
        itemList: itemList,
        mainPadding: mainPadding,
        numberOfRows: numberOfRows,
        width: width);
    return device == DeviceType.Mobile
        ? MobileDesign(
            aspectRatio: aspectRatioMobile,
            height: height,
            itemCount: itemList!.length,
            itemList: itemList,
            title: title,
            width: width,
            productItem: productItem,
          )
        : AnimatedItems(
            itemList: itemList,
            title: title,
            width: width,
            height: height,
            id: id!,
            numberOfRows: numberOfRows,
            mainPadding: mainPadding,
            aspectRatio: aspectRatioNoMobile,
            crossAxisCount: instanceSizes.crossAxisCount,
            wrapCount: instanceSizes.wrapCount,
            stackHeight: instanceSizes.stackHeight,
            space: instanceSizes.space,
            gridWidth: instanceSizes.gridWidth,
            productItem: productItem,
          );
  }
}

class ArrowWidget extends StatelessWidget {
  ArrowWidget(
      {Key? key,
      this.controller,
      this.itemLength,
      this.id,
      this.crossAxisCount,
      this.wrapCount})
      : super(key: key);
  dynamic controller;
  final List? itemLength;

  final int? id, crossAxisCount, wrapCount;
  @override
  Widget build(BuildContext context) {
    return itemLength!.length > crossAxisCount! * 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.moveBack(id: id, wrapCount: wrapCount);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                  )),
              IconButton(
                onPressed: () {
                  controller.moveNext(id: id, wrapCount: wrapCount);
                },
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
      this.itemList,
      this.productItem})
      : super(key: key);

  final String? title;
  final double? height, aspectRatio, width;
  final int? itemCount, productItem;
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
                          productItem: productItem,
                        )),
                  );
                })),
      ],
    );
  }
}

class AnimatedItems extends StatelessWidget {
  const AnimatedItems(
      {Key? key,
      this.width,
      this.crossAxisCount,
      this.itemList,
      this.mainPadding,
      this.aspectRatio,
      this.wrapCount,
      this.space,
      this.height,
      this.numberOfRows,
      this.id,
      this.title,
      this.stackHeight,
      this.gridWidth,
      this.productItem})
      : super(key: key);

  final double? width,
      mainPadding,
      aspectRatio,
      space,
      height,
      stackHeight,
      gridWidth;
  final int? crossAxisCount, wrapCount, numberOfRows, id, productItem;
  final List? itemList;
  final String? title;

  int listIndex(index) {
    if (index == wrapCount! - 1 &&
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

  int stageNumber(index) {
    return index! * (crossAxisCount! * numberOfRows!);
  }

  @override
  Widget build(BuildContext context) {
    MoveSliderMain controller = Get.put(MoveSliderMain(
        itemsList: itemList,
        width: width,
        crossAxisCount: crossAxisCount,
        numberOfRows: numberOfRows));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        SizedBox(
          height: stackHeight,
          child: GetBuilder<MoveSliderMain>(builder: (context) {
            return Stack(
                children: List.generate(
                    wrapCount!,
                    (index) => AnimatedPositioned(
                        left: width! * index.toDouble() +
                            controller.moveUnit[id!],
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: SizedBox(
                            width: width! / 1.09,
                            child: Wrap(
                              spacing: space!,
                              runSpacing: space!,
                              children:
                                  List.generate(listIndex(index), (index2) {
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
                                  width: gridWidth,
                                  child: AspectRatio(
                                      aspectRatio: aspectRatio!,
                                      child: ViewItemContent(
                                        index: index2 + stageNumber(index),
                                        itemList: itemList,
                                        aspectRatio: aspectRatio,
                                        width: width,
                                        height: height!,
                                        productItem: productItem,
                                      )),
                                );
                              }),
                            ),
                          ),
                        ))));
          }),
        ),
        ArrowWidget(
            controller: controller,
            itemLength: itemList,
            id: id,
            crossAxisCount: crossAxisCount,
            wrapCount: wrapCount)
      ],
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
      this.height,
      this.productItem})
      : super(key: key);
  final List? itemList;
  final int? index, productItem;
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
                        (index2) => Icon(Icons.star_rate,
                            size: 17,
                            color: index2 < itemList![index!].stars
                                ? Colors.orange
                                : Colors.grey)))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "${itemList![index!].price!} EGP ",
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
                      Cart controller = Get.put(Cart());
                      controller.addToCart(
                          context: context,
                          image: itemList![index!].image!,
                          price: itemList![index!].price!,
                          stars: itemList![index!].stars!,
                          title: itemList![index!].title!,
                          width: width,
                          productItem: productItem,
                          itemIndex: index);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
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
  static double maxHeight = 300;
  static double minHeight = 210;
  double? widthValue;

  int get crossAxisCount {
    if (device == DeviceType.Tablet) {
      if (width! < 800) {
        widthValue = 3.53;
        return 3;
      } else {
        widthValue = 4.85;
        return 4;
      }
    } else {
      widthValue = 6.25;
      return 5;
    }
  }

  int get wrapCount {
    return (itemList!.length / (crossAxisCount * numberOfRows!)).ceil();
  }

  double get space {
    return width! / 36;
  }

  double get gridWidth {
    return width! / widthValue!;
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
    if (itemList!.length > crossAxisCount && numberOfRows! > 1) {
      return height * 2 + space + 20;
    } else {
      return height + 20;
    }
  }
}
