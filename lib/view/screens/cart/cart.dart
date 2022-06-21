import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/view_details_controller.dart';
import 'package:solo/models/tablet_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/fotter/fotter.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/view_item.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Head(width: width),
            Padding(
              padding: EdgeInsets.only(
                  left: width / 24, right: width / 24, top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: width / 14.4 < 70 ? 70 : width / 14.4,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Your cart is empty",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 15,
                                          bottom: 15))),
                              onPressed: () {
                                Get.to(() => const HomePage());
                              },
                              child: const Text(
                                "Continue Shopping",
                                style: TextStyle(fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                    device == DeviceType.Desktop
                        ? BestSellingProducts(
                            title: "Best Selling Products",
                            width: width,
                            height: width * 0.50,
                            mainPadding: width / 24,
                            aspectRatio: 1.1,
                            itemList: tablets,
                            numberOfRows: 1,
                          )
                        : MobileDesign(
                            aspectRatio: 1.1,
                            height: width * 0.50,
                            itemCount: tablets.length,
                            itemList: tablets,
                            title: "Best Selling Products",
                            width: width,
                          ),
                    const SizedBox(height: 50),
                    Fotter(width: width),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellingProductsController extends MoveSliderData {
  BestSellingProductsController({this.itemsList, this.width});
  double? width;
  List? itemsList;
}

class BestSellingProducts extends StatelessWidget {
  const BestSellingProducts(
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
        ArrowWidget(controller: controller, itemLength: itemList!),
      ],
    );
  }
}
