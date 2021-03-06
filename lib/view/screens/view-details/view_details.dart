import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/view_details_controller.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/fotter/fotter.dart';
import 'package:solo/view/screens/view-details/bottom_sheet.dart';
import 'package:solo/view/screens/view-details/cient_review.dart';
import 'package:solo/view/screens/view-details/details.dart';
import 'package:solo/view/screens/view-details/information_design.dart';
import 'package:solo/view/screens/view-details/view_all_rieviw.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/view_item.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails(
      {Key? key,
      this.title,
      this.height,
      this.aspectRatio,
      this.width,
      this.itemList,
      this.index,
      this.numberOfRows})
      : super(key: key);
  final String? title;
  final double? height, aspectRatio, width;
  final int? index, numberOfRows;
  final List? itemList;
  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails>
    with TickerProviderStateMixin {
  get product {
    return widget.itemList![widget.index!];
  }

  double get fontTitle {
    return widget.width! / 22.5 > 18 ? 18 : widget.width! / 22.5;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.width);
    print("ratio ----- ${widget.height}");
    ImageSlider controller =
        Get.put(ImageSlider(imagesTab: product.images, product: product));
    controller.initStates(this);
    return Scaffold(
      backgroundColor: const Color(0xFFe1e1e3),
      bottomNavigationBar:
          device == DeviceType.Desktop ? const SizedBox() : NavigationBar(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Head(width: widget.width),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.width! / 24,
                  right: widget.width! / 24,
                  top: device == DeviceType.Mobile
                      ? 115
                      : device == DeviceType.Tablet
                          ? 160
                          : 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    device == DeviceType.Desktop
                        ? ProductImagesDesktop(
                            controller: controller,
                            fontTitle: fontTitle,
                            product: product,
                            width: widget.width)
                        : ProductImages(
                            controller: controller,
                            fontTitle: fontTitle,
                            product: product,
                            width: widget.width),
                    const SizedBox(height: 15),
                    device == DeviceType.Desktop
                        ? Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: device == DeviceType.Desktop
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Specifications",
                                    style: TextStyle(
                                        fontSize: fontTitle + 3,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: InformationDesign(
                                      width: widget.width,
                                      manualWidth: true,
                                      keys: controller.specificationsKeys,
                                      values: controller.specificationsValues,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Details(
                            controller: controller,
                            fontTitle: fontTitle,
                            product: product,
                            width: widget.width,
                          ),
                    const SizedBox(height: 20),
                    widget.itemList![widget.index!].reviews.isNotEmpty == true
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: const Color(0xFFffffff),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Text(
                                    "User Review",
                                    style: TextStyle(
                                        fontSize: fontTitle,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  children: [
                                    device == DeviceType.Mobile
                                        ? const SizedBox()
                                        : ViewRating(),
                                    Column(
                                        children: List.generate(
                                            product.reviews.length > 3
                                                ? 3
                                                : product.reviews.length,
                                            (index) => ClientReview(
                                                  items: product.reviews,
                                                  reviewIndex: index,
                                                ))),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 5),
                    product.reviews.length > 3
                        ? TextButton(
                            onPressed: () {
                              bottomSheet(context,
                                  title: "User Review",
                                  sheetWidget: ViewAllRieviw(
                                    reviewsList: product.reviews,
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              color: const Color(0xFFffffff),
                              height: 40,
                              width: 250,
                              child: Text(
                                "View More",
                                style: TextStyle(
                                    fontSize: fontTitle,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        : const SizedBox(),
                    const SizedBox(height: 15),
                    device == DeviceType.Desktop
                        ? ViewAlso(
                            title: "Customer Also Viewed",
                            width: widget.width,
                            height: widget.width! * 0.50,
                            mainPadding: widget.width! / 24,
                            aspectRatio: 1.1,
                            itemList: widget.itemList!,
                            numberOfRows: widget.numberOfRows!,
                          )
                        : MobileDesign(
                            aspectRatio: widget.aspectRatio,
                            height: widget.width! * widget.height!,
                            itemCount: widget.itemList!.length,
                            itemList: widget.itemList,
                            title: widget.title,
                            width: widget.width,
                          ),
                    const SizedBox(height: 15),
                    Container(
                      color: const Color(0xFFffffff),
                      padding: const EdgeInsets.all(10),
                      child: Fotter(width: widget.width),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
            device == DeviceType.Mobile
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: widget.width,
                      height: 43,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(220, 222, 221, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 33,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ChargeButton(title: "Add To Cart"),
                                    ChargeButton(title: "Buy Now")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class ProductImagesDesktop extends StatelessWidget {
  const ProductImagesDesktop(
      {Key? key, this.product, this.controller, this.fontTitle, this.width})
      : super(key: key);
  final product, controller;
  final double? fontTitle, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImages(
                    controller: controller,
                    fontTitle: fontTitle,
                    product: product,
                    width: width),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      product.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Details(
                    controller: controller,
                    fontTitle: fontTitle,
                    product: product,
                    width: width,
                  ),
                  Container(
                    width: 430,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(245, 176, 66, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Delivery(width: width),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ChargeButton(title: "Add To Cart"),
                              ChargeButton(title: "Buy Now")
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class ProductImages extends StatelessWidget {
  const ProductImages(
      {Key? key, this.product, this.fontTitle, this.width, this.controller})
      : super(key: key);

  final product, controller;
  final double? fontTitle, width;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: product.images.length,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: device == DeviceType.Desktop
                  ? const SizedBox()
                  : Text(
                      product.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontTitle,
                      ),
                    ),
            ),
            SizedBox(
              height: width! / 2.4 > 350 ? 350 : width! / 2.4,
              child: TabBarView(
                controller: controller.execute,
                children: List.generate(
                    product.images.length,
                    (index) => Image.asset(
                          product.images[index],
                          width: width! * 0.85,
                        )),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                GetBuilder<ImageSlider>(builder: (context) {
                  return TabBar(
                      controller: controller.execute,
                      isScrollable: true,
                      indicatorPadding: const EdgeInsets.all(10),
                      labelColor: Colors.red,
                      indicatorColor: Colors.white,
                      indicator: null,
                      labelPadding: const EdgeInsets.all(5),
                      unselectedLabelColor: Colors.yellow,
                      onTap: (indexNum) {
                        print(indexNum);
                      },
                      tabs: controller.imgaes());
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAlso extends StatelessWidget {
  const ViewAlso(
      {Key? key,
      this.itemList,
      this.width,
      this.mainPadding,
      this.aspectRatio,
      this.title,
      this.height,
      this.numberOfRows})
      : super(key: key);
  final List? itemList;
  final int? numberOfRows;
  final double? width, mainPadding, aspectRatio, height, itemwidth = 250;
  final String? title;
  @override
  int get viewCount {
    if (width! > 1200) {
      return 5;
    } else {
      return 4;
    }
  }

  int get wrapCount {
    return (itemList!.length / viewCount).ceil();
  }

  double get space {
    return (width! - mainPadding! * 2 - itemwidth! * viewCount) /
        (viewCount - 1);
  }

  Widget build(BuildContext context) {
    SizesData instanceSizes = SizesData(
        aspectRatio: aspectRatio!,
        itemList: itemList,
        mainPadding: mainPadding,
        numberOfRows: numberOfRows,
        width: width);
    MoveSliderData controller =
        Get.put(MoveSliderData(width: width, wrapCount: wrapCount));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: Theme.of(context).textTheme.headline6),
        ),
        SizedBox(
          height: 240,
          child: Stack(
              children: List.generate(
            wrapCount,
            (index) => GetBuilder<MoveSliderData>(builder: (context) {
              return AnimatedPositioned(
                  left: width! * index.toDouble() + controller.moveUnit,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedPosition2(
                    crossAxisCount: viewCount,
                    width: width,
                    itemList: itemList,
                    numberOfRows: numberOfRows!,
                    mainPadding: mainPadding,
                    index2: index,
                    wrapCount: wrapCount,
                    aspectRatio: aspectRatio,
                    gridWidth: itemwidth,
                    space: space,
                    height: height,
                  ));
            }),
          )),
        ),
        ArrowWidget(
          controller: controller,
          itemLength: itemList!,
        )
      ],
    );
  }
}
