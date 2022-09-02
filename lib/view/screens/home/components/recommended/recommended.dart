import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

import '../../../../style.dart';

class Recommended extends StatelessWidget {
   Recommended({Key? key, this.width, this.title, this.data})
      : super(key: key);
  final double? width;
  final String? title;
  final List? data;
  double get itemWidth {
    if (width! < 500) {
      return width!;
    } else {
      return 500;
    }
  }

  double? designHeight, designWidth;
  responsiveSizes() {
    if (width! < 850) {
      designHeight = width! / 2.57 > 160 ? 160 : width! / 2.57;
      designWidth = width;
    }else{
      designWidth = 500;
      designHeight = 160;
    }
  }


  @override
  Widget build(BuildContext context) {
    responsiveSizes();
    if (device == DeviceType.Desktop) {
      return RecommendedDesktopDesign(
        data: data!,
        width: width,
        title: title!,
        showCountInRow: 3,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title!,
              style: titleStyle,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFc2c2c2),
                  offset: Offset(0, 0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            height: itemWidth / 2.76,
            child: ListView.builder(
             // itemExtent: itemWidth / 1.1,
              itemCount: data!.length,
              cacheExtent: itemWidth / 36,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
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
                                                  (index) => Icon(Icons.star_rate,
                                                  size: 17.0,
                                                  color: index > 2
                                                      ? Colors.grey
                                                      : Colors.green))),
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
                                        child: Text(
                                            data![index]["item"].description,
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
                                  const Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                          "13.000 EGP",
                                          maxLines: 1,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                );

              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      );
    }
  }
}

class RecommendedDesktopDesign extends StatelessWidget {
  const RecommendedDesktopDesign(
      {Key? key,
      this.data,
      this.width,
      this.showCountInRow,
      this.title})
      : super(key: key);
  final List? data;
  final double? width;
  final int? showCountInRow;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(title!,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold))),
        Column(
          children: List.generate(
              data!.length > 3 ? 2 : 1,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: width! / 55.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(showCountInRow!, (index2) {
                        return Container(
                          decoration:
                          const BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                            BoxShadow(
                                color: Color(0xFFbababa),
                                blurRadius: 7,
                                spreadRadius: 0.5,
                                offset: Offset(0, 0))
                          ]),
                          width: width! / 3.44,
                          height: 160,
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
                                                    height: 160 * 0.50,
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
                                                      (index) => Icon(Icons.star_rate,
                                                      size: 17.0,
                                                      color: index > 2
                                                          ? Colors.grey
                                                          : Colors.green))),
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
                                            child: Text(
                                                data![index]["item"].description,
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
                                      const Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              "13.000 EGP",
                                              maxLines: 1,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  )),
        ),
        data!.length > showCountInRow! * 2
            ? const TextButton(onPressed: null, child: Text("Show All"))
            : const SizedBox()
      ],
    );
  }
}
