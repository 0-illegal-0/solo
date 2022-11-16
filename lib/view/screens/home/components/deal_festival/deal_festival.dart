import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/left_side_element.dart';

import '../../../../style.dart';

class DealFestival extends StatelessWidget {
  DealFestival({
    Key? key,
    this.width,
    this.title,
    this.data,
    this.padding,
    this.mainData,
  }) : super(key: key) {
    responsiveSizes();
    festivalData ??= mainData;
  }

  final double? width, padding;
  final String? title;
  final List? data;

  double get itemWidth {
    if (width! < 500) {
      return width!;
    } else {
      return 500;
    }
  }

  static Map? festivalData;
  final Map? mainData;

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
    if (device == DeviceType.Desktop) {
      return DealFestivalForNonTablet(
        width: width,
        title: title,
      );
    } else if (device == DeviceType.Tablet) {
      return DealFestivalForNonTablet(
        width: width,
        title: title,
      );
    } else {
      return DealFestivalForMobile(
        width: width,
        title: title,
      );
    }
  }
}

class DealFestivalForMobile extends StatelessWidget {
  const DealFestivalForMobile({Key? key, this.width, this.title})
      : super(key: key);
  final double? width;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        SizedBox(
          height: 250,
          child: GridView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5, crossAxisCount: 1),
            children: [
              LaptopAdvertise(
                width: width,
              ),
              Column(children: [
                Expanded(
                    child: TabletAndMobileAdvertise(
                  width: width,
                  fontColor: const Color(0xFF045187),
                  textNote: true,
                )),
                const SizedBox(height: 5),
                Expanded(
                    child: TabletAndMobileAdvertise(
                  width: width,
                  fontColor: const Color(0xFFd1bc19),
                  textNote: false,
                )),
              ]),
              TvAdvertise(
                width: width,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DealFestivalForNonTablet extends StatelessWidget {
  const DealFestivalForNonTablet({Key? key, this.width, this.title})
      : super(key: key);
  final double? width;
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
        SizedBox(
          height: width! * 0.35,
          child: Row(
            children: [
              Expanded(
                  child: LaptopAdvertise(
                width: width,
              )),
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
                            child: TabletAndMobileAdvertise(
                              width: width,
                              fontColor: const Color(0xFF045187),
                              textNote: true,
                            ),
                          ),
                          SizedBox(width: width! / 65),
                          Expanded(
                              child: TabletAndMobileAdvertise(
                            width: width,
                            fontColor: const Color(0xFFd1bc19),
                            textNote: false,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: width! / 65),
                    Expanded(
                      flex: 4,
                      child: TvAdvertise(
                        width: width,
                      ),
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

class TvAdvertise extends StatelessWidget {
  TvAdvertise({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double? width;

  Widget superSale() {
    return const Text("Super\nSale",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          height: 0.9,
          color: Color(0xFFf7e9f7),
          shadows: [
            Shadow(
              offset: Offset(0.0, 0.0),
              blurRadius: 2.0,
              color: Color(0xFF121112),
            ),
          ],
        ));
  }

  double imagePosition = 0, minImageWidth = 0;
  double imageWidth = 0;

  executeTvImageList(index) {
    if (index == 0 || index == 2) {
      imagePosition = width! < 650 ? 20 : width! / 11;
      imageWidth = width! * 0.07;
      minImageWidth = 45;
    } else {
      imagePosition = width! < 650 ? 32.2 : width! / 6.87;
      imageWidth = width! * 0.10;
      minImageWidth = 65;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFd4c2f2),
        height: width! * 0.12,
        padding: EdgeInsets.only(bottom: width! < 650 ? 5 : 0),
        child: InkWell(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: width! > 649 && width! < 851
                    ? 22
                    : width! < 650
                        ? 30
                        : width! / 32,
                child: CustomPaint(
                  painter: LapHeadDesign(color: const Color(0xFF5e135e)),
                  child: Center(
                    child: Text("Every Day New Discount Product",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFFc5c3c7),
                            fontSize: width! > 1100
                                ? 22
                                : width! > 850
                                    ? 17
                                    : 15,
                            fontFamily: "Contrail",
                            shadows: const [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xFF605d5f),
                              ),
                            ])),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 10,
                      top: width! < 650 ? 20 : 10),
                  child: Stack(
                    children: [
                      Stack(
                          alignment: AlignmentDirectional.center,
                          children: List.generate(
                              DealFestival.festivalData!["tv-image-collection"]
                                  .length, (index) {
                            executeTvImageList(index);
                            return index < 2
                                ? Positioned(
                                    left: imagePosition,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minWidth: minImageWidth),
                                      child: Image.asset(
                                          DealFestival.festivalData![
                                              "tv-image-collection"][index],
                                          width: imageWidth),
                                    ))
                                : index < 4
                                    ? Positioned(
                                        right: imagePosition,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minWidth: minImageWidth),
                                          child: Image.asset(
                                              DealFestival.festivalData![
                                                  "tv-image-collection"][index],
                                              width: imageWidth),
                                        ))
                                    : Align(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minWidth: 90),
                                          child: Image.asset(
                                              DealFestival.festivalData![
                                                  "tv-image-collection"][index],
                                              width: width! * 0.13),
                                        ),
                                      );
                          })),
                      width! < 650
                          ? const SizedBox()
                          : Positioned(bottom: 0, right: 0, child: superSale()),
                    ],
                  ),
                ),
              ),
              width! < 650 ? superSale() : const SizedBox()
            ],
          ),
          onTap: () {
            Get.toNamed("/product-page",
                arguments: {"index": 3, "width": width});
          },
        ));
  }
}

class TabletAndMobileAdvertise extends StatelessWidget {
  TabletAndMobileAdvertise(
      {Key? key, required this.width, this.textNote = false, this.fontColor})
      : super(key: key);

  final double? width;
  bool textNote;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          bottom: width! > 850 ? 15 : 5, top: 10, left: 5, right: 10),
      decoration: textNote == false
          ? const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Color(0xFF08b1cf),
                  Color(0xffed1f48),
                ]))
          : const BoxDecoration(color: Color(0xFFbed1d1)),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 110,
                    maxWidth: width! >= 650 && width! < 800 ? 70 : 250),
                child: Image.asset(
                    textNote == true
                        ? DealFestival.festivalData!["mobile-image"]
                        : DealFestival.festivalData!["tablet-image"],
                    alignment: Alignment.center,
                    height: width! * 0.14),
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textNote == true
                      ? "Super Sale \non mobile phone"
                      : "Top 10 best\nselling tablets",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: fontColor!,
                      fontSize: width! > 1100
                          ? 20
                          : width! > 850
                              ? 15
                              : 11.5,
                      shadows: const [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Color(0xFF242226),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                textNote == false
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: responsive(
                              device: width,
                              smallestWidth: 700,
                              smallestElement: 50,
                              mediumWidth: 1100,
                              meduimElement: 60,
                              largeElement: 70),
                          height: responsive(
                              device: width,
                              smallestWidth: 700,
                              smallestElement: 20,
                              mediumWidth: 1100,
                              meduimElement: 27,
                              largeElement: 30),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFdedede)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(color: Colors.black)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {
                                Get.toNamed("/product-page",
                                    arguments: {"index": 2, "width": width});
                                Get.deleteAll();
                              },
                              child: Text(
                                "Shoping",
                                style: TextStyle(
                                    fontSize: width! < 700 ? 11.5 : 13.5,
                                    shadows: const [
                                      Shadow(
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 1.5,
                                        color: Color(0xFF605d5f),
                                      ),
                                    ],
                                    color: Color(0xFF000000)),
                              )),
                        ),
                      )
                    : SizedBox(
                        width: width! > 1100
                            ? 65
                            : width! > 850
                                ? 60
                                : 39, //50,
                        height: 25,
                        child: CustomPaint(
                          painter: Poster(color: const Color(0xFFbd0f40)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                /*   top: width! > 850 ? 3 : 0, left: 2,*/ bottom:
                                    4),
                            child: Center(
                              child: Text(
                                "Harry Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    // height: 1,
                                    fontSize: width! > 850 ? 13 : 10,
                                    color: const Color(0xFFffffff)),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            )
          ],
        ),
        onTap: () {
          int? productIndex;
          textNote == true ? productIndex = 1 : productIndex = 2;
          Get.toNamed("/product-page",
              arguments: {"index": productIndex, "width": width});
        },
      ),
    );
  }
}

class LaptopAdvertise extends StatelessWidget {
  LaptopAdvertise({Key? key, this.width}) : super(key: key);
  final double? width;
  double get respnseveFont {
    return width! < 750 ? 17 : 20;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffbabad1),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(" Best laptops in 2023 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    backgroundColor: const Color(0xFFffffff),
                    fontSize: respnseveFont,
                    fontFamily: "Sansita",
                    color: const Color(0xFFb3078b),
                    fontWeight: FontWeight.bold)),
            Text(
              "High Performance",
              style: TextStyle(
                  fontSize: respnseveFont,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFf2f6f7),
                  fontFamily: "Titillium",
                  shadows: const [
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2.0,
                      color: Color(0xFF121112),
                    ),
                  ]),
            ),
            SizedBox(
              width: width! > 650 ? width! * 0.30 : 230,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                      left: 10,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 80),
                        child: Image.asset(
                            DealFestival
                                .festivalData!["laptop-image-collection"][0],
                            width: width! * 0.10),
                      )),
                  Positioned(
                      right: 10,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 80),
                        child: Image.asset(
                            DealFestival
                                .festivalData!["laptop-image-collection"][1],
                            width: width! * 0.10),
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 120),
                        child: Image.asset(
                            DealFestival
                                .festivalData!["laptop-image-collection"][2],
                            width: width! * 0.13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Impressive Laptop Power",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: respnseveFont,
                  color: const Color(0xFFf2f6f7),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Titillium",
                  shadows: const [
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2.0,
                      color: Color(0xFF121112),
                    ),
                  ]),
            ),
          ],
        ),
        onTap: () {
          Get.toNamed("/product-page", arguments: {"index": 0, "width": width});
        },
      ),
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

class LapHeadDesign extends CustomPainter {
  LapHeadDesign({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(size.width * 0, size.height * 0.80);
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(size.width * 0.75, size.height * 1);
    path.lineTo(size.width * 1, size.height * 0.75);
    path.lineTo(size.width * 1, size.height * 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
