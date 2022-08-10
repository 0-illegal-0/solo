import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/filter_controller.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/view/screens/product-page/components/filter_property.dart';
import 'package:solo/view/screens/product-page/components/item_color.dart';
import 'package:solo/view/screens/product-page/components/price_range.dart';
import 'package:solo/view/screens/product-page/components/rating.dart';
import 'package:solo/view/widget/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/view_item.dart';

class ProductPage extends StatelessWidget {
  ProductPage(
      {Key? key, this.category, this.width, this.aspectRatio, this.height})
      : super(key: key);
  final Product? category;
  final double? width, aspectRatio, height;
  double? filterWidth, itemCount, rowSpace;
  double get mainPadding {
    return width! / 35;
  }

  responsiveSizes() {
    if (width! < 1200 && width! > 900) {
      filterWidth = 250;
      itemCount = 3;
      rowSpace = width! / 28.8;
    } else if (width! < 900 && width! > 570) {
      filterWidth = 0.0;
      itemCount = 3;
      rowSpace = 0.0;
    } else if (width! <= 570) {
      filterWidth = 0.01;
      itemCount = 2;
      rowSpace = 0.0;
    } else {
      filterWidth = 250;
      itemCount = 4;
      rowSpace = width! / 28.8;
    }
  }

  double? get gridWidth {
    return (width! -
            filterWidth! -
            rowSpace! -
            mainPadding * (itemCount! - 1) -
            mainPadding * 2 -
            0.1) /
        itemCount!;
  }

  @override
  Widget build(BuildContext context) {
    responsiveSizes();
    FilterController controller =
        Get.put(FilterController(width: width, mainItem: category!.products));
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: GetBuilder<FilterController>(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: mainPadding,
                              right: mainPadding,
                              bottom: width! > 649 ? 270 : 0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const SizedBox(height: 190),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  width! > 900
                                      ? Filter(
                                          productPageFilterItems:
                                              productPageFilterItems(category),
                                          filterWidth: filterWidth,
                                          width: width,
                                          category: category,
                                          controller: controller,
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    width: width! < 901 ? 0 : rowSpace,
                                    height: controller.sizedBoxFilter,
                                  ),
                                  controller.afterfilter.isEmpty &&
                                          controller.mainItem!.isEmpty
                                      ? const Text("There is No Item")
                                      : controller.afterfilter.isEmpty &&
                                              controller.click != 0
                                          ? const Text("There is no items")
                                          : Expanded(
                                              child: Wrap(
                                                  runSpacing: mainPadding,
                                                  spacing: mainPadding,
                                                  children: List.generate(
                                                      controller.afterfilter.isEmpty &&
                                                              controller
                                                                      .click ==
                                                                  0
                                                          ? controller
                                                              .mainItem!.length
                                                          : controller
                                                              .afterfilter
                                                              .length,
                                                      (index) => Container(
                                                            decoration: const BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color(
                                                                          0xFFb1b3b5),
                                                                      blurRadius:
                                                                          5,
                                                                      spreadRadius:
                                                                          0.1,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0))
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            constraints: BoxConstraints(
                                                                maxHeight:
                                                                    SizesData
                                                                        .maxHeight,
                                                                minHeight: SizesData
                                                                    .minHeight),
                                                            width: gridWidth!,
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  aspectRatio!,
                                                              child:
                                                                  ViewItemContent(
                                                                index: index,
                                                                width: width,
                                                                aspectRatio:
                                                                    aspectRatio,
                                                                height: height,
                                                                itemList: controller
                                                                            .afterfilter.isEmpty &&
                                                                        controller.click ==
                                                                            0
                                                                    ? controller
                                                                        .mainItem
                                                                    : controller
                                                                        .afterfilter,
                                                              ),
                                                            ),
                                                          ))),
                                            ),
                                ],
                              ),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                        SizedBox(
                            width: width! * controller.intialValHiddenButton,
                            height: (controller.sizedBoxFilter) *
                                controller.intialValHiddenButton,
                            child: InkWell(onTap: () {
                              controller.displayFilter(
                                  categoryName: category!.productName);
                            })),
                        Positioned(
                            left: controller.hiddenFilterWidth,
                            top: 190,
                            child: SizedBox(
                              width: width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Filter(
                                    controller: controller,
                                    filterWidth: 250,
                                    category: category,
                                    productPageFilterItems:
                                        productPageFilterItems(category),
                                    width: width,
                                  ),
                                ],
                              ),
                            )),
                        width! < 901
                            ? Positioned(
                                top: 125,
                                child: FilterIcon(
                                  filterWidth: filterWidth,
                                  filter: controller.buttonName,
                                  category: category,
                                  controller: controller,
                                  productPageFilterItems:
                                      productPageFilterItems(category),
                                  width: width,
                                ),
                              )
                            : const SizedBox(),
                        Positioned(
                          bottom: 5,
                          child: Align(
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(mainPadding),
                                child: Fotter(width: width),
                              ),
                              width: width,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
            Head(width: width),
            const BottomRow()
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  Filter(
      {Key? key,
      this.productPageFilterItems,
      this.filterWidth,
      this.category,
      this.width,
      this.controller})
      : super(key: key);
  final List? productPageFilterItems;
  final double? filterWidth, width;
  final Product? category;

  dynamic controller;
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF787575),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 0))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        width: filterWidth,
        child: Column(
          children: [
            PriceRange(
              controller: controller,
              width: width,
            ),
            Column(
                children: List.generate(
              productPageFilterItems!.length,
              (index) {
                controller.checkboxValues(
                    itemProperty: productPageFilterItems![index]["items"]);
                id = index == 0
                    ? 0
                    : productPageFilterItems![index - 1]["items"].length + id;
                return productPageFilterItems![index]["items"].length == 0
                    ? const SizedBox()
                    : FilterProperty(
                        id: id,
                        itemProperty: productPageFilterItems![index]["items"],
                        controller: controller,
                        width: width!,
                        title: productPageFilterItems![index]["title"]);
              },
            )),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Discount",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Checkbox(
                    value: controller.discount,
                    onChanged: (val) {
                      controller.discountValue();
                      controller.filterResult(
                          items: [], filterTitle: "Discount", checkVal: val);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon(
      {Key? key,
      this.productPageFilterItems,
      this.filterWidth,
      this.width,
      this.controller,
      this.category,
      this.filter})
      : super(key: key);

  final List? productPageFilterItems;
  final double? filterWidth, width;
  final dynamic controller;
  final Product? category;
  final String? filter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width! / 48),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF115978)),
            overlayColor: MaterialStateProperty.all(const Color(0xFF000000)),
            foregroundColor:
                MaterialStateProperty.all(const Color(0xFFffffff))),
        child: Row(
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              color: Color(0xFFeb1038),
            ),
            Text(
              filter!,
              style: const TextStyle(fontSize: 18, letterSpacing: 1.2),
            ),
          ],
        ),
        onPressed: () {
          controller.displayFilter(categoryName: category!.productName);
        },
      ),
    );
  }
}
