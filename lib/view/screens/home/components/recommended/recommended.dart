import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

import '../../../../style.dart';

class Recommended extends StatelessWidget {
  Recommended({Key? key, this.width, this.title, this.data}) : super(key: key);
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
    } else {
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
    } else if (device == DeviceType.Tablet) {
      return RecommendedForTablet(width: width);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(title!, style: titleStyle),
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
                      decoration: const BoxDecoration(
                          color: Color(0xFFffffff),
                          boxShadow: [
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              5,
                                              (index2) => Icon(Icons.star_rate,
                                                  size: 17.0,
                                                  color: index2 <
                                                          data![index]["item"]
                                                              .stars
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
                    const SizedBox(width: 10)
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
      {Key? key, this.data, this.width, this.showCountInRow, this.title})
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
          child: Text(title!, style: titleStyle),
        ),
        Column(
          children: List.generate(
              data!.length > 3 ? 2 : 1,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: width! / 55.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(showCountInRow!, (index2) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFFffffff),
                              boxShadow: [
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
                                        aspectRatio: data![index]
                                            ["aspectRatio"],
                                        height: data![index]["height"],
                                        itemList: data![index]["item-list"],
                                        index: data![index]["index"],
                                        numberOfRows: 1,
                                        title: "Customer  Viewed",
                                        productItem: data![index]
                                            ["product-index"],
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                          child: Padding(
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
                                                data![index]["item"]
                                                    .description,
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

class RecommendedForTablet extends StatelessWidget {
  const RecommendedForTablet({Key? key, this.width}) : super(key: key);
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Deal Festival", style: titleStyle),
        ),
        SizedBox(
          height: width! * 0.35,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xff4d7ab1), //aab3e7  0xff0f8a79
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: width! * 0.20,
                        height: width! * 0.025,
                        alignment: Alignment.center,
                        color: const Color(0xFFffffff),
                        child: const Text("Best laptops in 2023",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21,
                                fontFamily: "Sansita",
                                color: Color(0xFFb3078b),
                                fontWeight: FontWeight.bold)),
                      ),
                      const Text(
                        "High Performance",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                            fontFamily: "Titillium",
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xFF605d5f),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: width! * 0.30,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                                left: 10,
                                child: Image.asset(
                                    "assets/advertise/macbook-pro.png",
                                    width: width! * 0.10)),
                            Positioned(
                                right: 10,
                                child: Image.asset(
                                    "assets/advertise/laptop-advertise1.png",
                                    width: width! * 0.10)),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                  "assets/advertise/lenovo-l340.png",
                                  width: width! * 0.13),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Impressive Laptop Power",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Titillium",
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xFF605d5f),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: width! / 65),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: const Color(0xFFc9963e),
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Image.asset(
                                          "assets/advertise/phone-advertise.png",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 60),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 33),
                                            child: Text(
                                              "Super Sale",
                                              style: TextStyle(
                                                fontSize: 21,
                                                color: Color(0xFFb3078b),
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 1.0,
                                                    color: Color(0xFFd0cfd1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text("On Mobile Phones",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFb3078b),
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(0.50, 0.50),
                                                  blurRadius: 0.50,
                                                  color: Color(0xFFd0cfd1),
                                                ),
                                              ],
                                            )),
                                        /*   const SizedBox(height: 25),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "Up To 70% Off \nOn Latest Mobile",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFffffff),
                                              )),
                                        ),*/
                                        const SizedBox(height: 77),
                                        SizedBox(
                                          width: 80,
                                          height: 30,
                                          child: CustomPaint(
                                            painter: Poster(
                                                color: const Color(0xFFbd0f40)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(top: 3),
                                              child: Text(
                                                "Harry Up",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFFffffff)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width! / 65),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Color(0xFF08b1cf),
                                  Color(0xffed1f48),
                                ])),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                      "assets/advertise/tablet-advertise33.png",
                                      width: width! * 0.15,
                                      height: width! * 0.14),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 26),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "Top 10 best selling\ntablets",
                                          style: TextStyle(
                                              color: Color(0xFFd1bc19),
                                              fontSize: 16,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color(0xFF242226),
                                                ),
                                              ],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 80),
                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xFFdedede)),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(85, 28)),
                                            textStyle:
                                                MaterialStateProperty.all(
                                                    const TextStyle(
                                                        color: Colors.black)),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.zero)),
                                        onPressed: () {
                                          Get.to(
                                              () => ProductPage(
                                                    category: solo.product[2],
                                                    width: width,
                                                    productItem: 2,
                                                    aspectRatio: solo
                                                        .product[2].aspectRatio,
                                                    height:
                                                        solo.product[2].height,
                                                  ),
                                              preventDuplicates: false);
                                          Get.deleteAll();
                                        },
                                        child: const Text("Shoping",
                                            style: TextStyle(shadows: [
                                              Shadow(
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 3.0,
                                                color: Color(0xFF605d5f),
                                              ),
                                              /* Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 8.0,
                            color: Color(0xFFbdbdcd),
                          ),*/
                                            ], color: Color(0xFF000000)))),
                                  ],
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: width! / 65),
                    Expanded(
                      flex: 4,
                      child: Container(
                          color: const Color(
                              0xFFa89332), //const Color(0xFFb00e5f),
                          height: width! * 0.12,
                          // alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              const Spacer(),
                              const Text("Every Day New Discount Product",
                                  style: TextStyle(
                                      color: Color(0xFFc5c3c7),
                                      fontSize: 20,
                                      fontFamily: "Contrail",
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Color(0xFF605d5f),
                                        ),
                                        /* Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 8.0,
                            color: Color(0xFFbdbdcd),
                          ),*/
                                      ])),
                              const Spacer(),
                              Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: width! * 0.40,
                                      child: Stack(
                                        /* alignment:
                                            AlignmentDirectional.bottomCenter,*/
                                        children: [
                                          Positioned(
                                              left: 10,
                                              child: Image.asset(
                                                  "assets/advertise/tornado-32-2.png",
                                                  width: width! * 0.07)),
                                          Positioned(
                                              left: 60,
                                              child: Image.asset(
                                                  "assets/advertise/tornado-32.png",
                                                  width: width! * 0.10)),
                                          Positioned(
                                              right: 10,
                                              child: Image.asset(
                                                  "assets/advertise/grow-1.png",
                                                  width: width! * 0.07)),
                                          Positioned(
                                              right: 60,
                                              child: Image.asset(
                                                  "assets/advertise/fish.png",
                                                  width: width! * 0.10)),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Image.asset(
                                                "assets/advertise/baloon.png",
                                                width: width! * 0.13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: SizedBox(
                                        width: 63,
                                        height: 48,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            SizedBox(
                                              width: 63,
                                              height: 48,
                                              child: CustomPaint(
                                                painter: BestOffer(
                                                    color: const Color(
                                                        0xFFe1d8dc)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 60,
                                              height: 45,
                                              child: CustomPaint(
                                                painter: BestOffer(
                                                  color:
                                                      const Color(0xFFe51870),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(height: 5),
                                                      Text("SUPER",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xFFe5b618))),
                                                      Text("Sale",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xFFffffff)))
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendedPainter extends CustomPainter {
  RecommendedPainter({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.35, size.height);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.75,
        size.width * 0.50, size.height * 0.50);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.25, size.width * 0.35, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Poster extends CustomPainter {
  Poster({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.70);
    path.lineTo(size.width * 0.50, size.height);
    path.lineTo(size.width, size.height * 0.70);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BestOffer extends CustomPainter {
  BestOffer({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width * 0.50, 0);
    path.lineTo(size.width * 0, size.height * 0.25);
    path.lineTo(size.width * 0, size.height);
    path.lineTo(size.width * 1, size.height);
    path.lineTo(size.width * 1, size.height * 0.25);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
