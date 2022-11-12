import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/style.dart';

class LeftSideElement extends StatelessWidget {
  LeftSideElement(
      {Key? key,
      this.width,
      this.mainPadding,
      this.space,
      this.title,
      this.itemCountForTablet,
      this.itemCountForDesktop,
      this.data})
      : super(key: key) {
    getDevice(width);
    responsiveSizes();
  }
  final double? width, mainPadding, space;
  final String? title;
  final List? data;
  final int? itemCountForTablet, itemCountForDesktop;
  double? designHeight, designWidth;

  responsiveSizes() {
    if (width! < 750) {
      designHeight = width! / 2.57 > 160 ? 160 : width! / 2.57;
      designWidth = width;
    } else if (width! < 1300) {
      designHeight = 160;
      designWidth = width! / 2.22;
    } else {
      designHeight = 160;
      designWidth = width! / 3.33;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        Wrap(
            spacing: space!,
            runSpacing: space!,
            children: List.generate(data!.length, (index) {
              return Container(
                decoration:
                    const BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                  BoxShadow(
                      color: Color(0xFFbababa),
                      blurRadius: 7,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                width: designWidth!,
                height: designHeight,
                child: InkWell(
                  onTap: () {
                    Get.to(
                        () => ViewDetails(
                              width: width!,
                              aspectRatio: data![index]["aspectRatio"],
                              height: data![index]["height"],
                              itemList: data![index]["item-list"],
                              index: data![index]["index"],
                              numberOfRows: 1,
                              title: "Customer  Viewed",
                              productItem: data![index]["product-index"],
                            ),
                        preventDuplicates: false);
                    Get.deleteAll();
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 5, top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          data![index]["item"].image,
                                          height: designHeight! * 0.50,
                                        ),
                                        Text(
                                          data![index]["item"].title,
                                          softWrap: false,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        const Divider(
                                          height: 0,
                                          color: Colors.grey,
                                          indent: 00,
                                          endIndent: 0,
                                          thickness: 1,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        5,
                                        (index2) => Icon(Icons.star_rate,
                                            size: 17.0,
                                            color: index2 <
                                                    data![index]["item"].stars
                                                ? Colors.orange
                                                : Colors.grey))),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 5, left: 5),
                                  child: Text(data![index]["item"].description,
                                      maxLines: 5),
                                )),
                            const Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Divider(
                                  height: 0,
                                  color: Colors.grey,
                                  indent: 00,
                                  endIndent: 0,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data![index]["item"].price!} EGP",
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: IconButton(
                                          alignment: Alignment.topRight,
                                          padding: const EdgeInsets.only(
                                              right: 3, bottom: 3),
                                          color: Colors.green,
                                          icon: const Icon(
                                              Icons.shopping_cart_outlined),
                                          onPressed: () {
                                            Cart controller = Get.put(Cart());
                                            controller.addToCart(
                                                context: context,
                                                image:
                                                    data![index]["item"].image!,
                                                price:
                                                    data![index]["item"].price!,
                                                stars:
                                                    data![index]["item"].stars!,
                                                title:
                                                    data![index]["item"].title!,
                                                width: width,
                                                productItem: data![index]
                                                    ["product-index"],
                                                itemIndex: data![index]
                                                    ["index"]);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })),
      ],
    );
  }
}
