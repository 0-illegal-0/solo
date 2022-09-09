import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/style.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import '../responsive.dart';
import 'navigation_bar.dart';

class ShowItemWrap extends StatelessWidget {
  ShowItemWrap({
    Key? key,
    this.data,
    this.title,
  }) : super(key: key);

  final List? data;
  final String? title;
  double? itemWidth;
  int? itemCount;

  getItemWidth(width) {
    if (width! < 1000) {
      itemCount = 6;
      itemWidth = width! / 3.7;
    } else {
      itemCount = 8;
      itemWidth = width! / 5.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double space = width / 30;
    getDevice(width);
    getItemWidth(width);
    return Scaffold(
        backgroundColor: const Color(0xFFe1e1e3),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                        height: device == DeviceType.Mobile
                            ? 115
                            : device == DeviceType.Tablet
                                ? 155
                                : 140),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(title!, style: titleStyle),
                    ),
                    Wrap(
                        spacing: space,
                        runSpacing: 20,
                        children: List.generate(
                          data!.length,
                          (index) => SizedBox(
                            width: itemWidth,
                            child: AspectRatio(
                                aspectRatio: 0.9,
                                child: InkWell(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xFF999797),
                                                blurRadius: 10,
                                                spreadRadius: 0.5,
                                                offset: Offset(0, 0))
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  width / 45 > 20
                                                      ? 20
                                                      : width / 45),
                                              child: Image.asset(
                                                  data![index]["item"].image!),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              data![index]["item"].title!,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Row(
                                                  children: List.generate(
                                                      5,
                                                      (index2) => Icon(
                                                          Icons.star_rate,
                                                          size: 17,
                                                          color: index2 <
                                                                  data![index][
                                                                          "item"]
                                                                      .stars
                                                              ? Colors.orange
                                                              : Colors.grey)))),
                                          const SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${data![index]["item"].oldPrice} EGP",
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                const Expanded(
                                                  child: Text(
                                                    " 25% off",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF32a852),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    "${data![index]["item"].price!} EGP ",
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25,
                                                child: IconButton(
                                                  alignment: Alignment.topRight,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3, bottom: 3),
                                                  color: Colors.orange,
                                                  icon: const Icon(Icons
                                                      .shopping_cart_outlined),
                                                  onPressed: () {
                                                    Cart controller =
                                                        Get.put(Cart());
                                                    controller.addToCart(
                                                        context: context,
                                                        image: data![index]
                                                                ["item"]
                                                            .image!,
                                                        price: data![index]
                                                                ["item"]
                                                            .price!,
                                                        stars: data![index]
                                                                ["item"]
                                                            .stars,
                                                        title: data![index]
                                                                ["item"]
                                                            .title!,
                                                        width: width,
                                                        itemIndex: data![index]
                                                            ['index'],
                                                        productItem: data![
                                                                index]
                                                            ['product-index']);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(
                                        () => ViewDetails(
                                          width: width,
                                          aspectRatio: data![index]
                                              ["aspectRatio"],
                                          height:
                                              width * data![index]["height"],
                                          itemList: data![index]["item-list"],
                                          productItem: data![index]
                                              ['product-index'],
                                          index: data![index]["index"],
                                          numberOfRows: 1,
                                          title: "Customer  Viewed",
                                        ), /* preventDuplicates: false*/
                                      );
                                      //  Get.deleteAll();
                                    })),
                          ),
                        )),
                    const SizedBox(height: 20),
                    Close(width: width),
                  ],
                ),
              ),
            ),
            Head(width: width),
            const BottomRow(),
          ],
        ));
  }
}
