import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/left_side_element.dart';

import '../../../../style.dart';

class DealFestival extends StatelessWidget {
  DealFestival(
      {Key? key,
      this.width,
      this.title,
      this.data,
      this.padding,
      this.tabletImage,
      this.mobileImage,
      this.textLabelForMobile,
      this.festivalTitleForMobile,
      this.festivalTitleForTablet,
      this.tvTitle,
      this.tvImageCollection,
      this.tvLabel})
      : super(key: key);
  final double? width, padding;
  final String? title;
  final List? data;
  final List<String>? tvImageCollection;
  final String? tabletImage,
      mobileImage,
      textLabelForMobile,
      festivalTitleForMobile,
      festivalTitleForTablet,
      tvTitle,
      tvLabel;

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
      return RecommendedForTablet(
          width: width,
          title: title,
          festivalTitleForMobile: festivalTitleForMobile,
          festivalTitleForTablet: festivalTitleForTablet,
          mobileImage: mobileImage,
          tabletImage: tabletImage,
          textLabelForMobile: textLabelForMobile,
          tvImageCollection: tvImageCollection,
          tvLabel: tvLabel,
          tvTitle: tvTitle);
    } else {
      return RecommendedForMobile(
        width: width,
        title: title,
        festivalTitleForMobile: festivalTitleForMobile,
        festivalTitleForTablet: festivalTitleForTablet,
        mobileImage: mobileImage,
        tabletImage: tabletImage,
        textLabelForMobile: textLabelForMobile,
        tvImageCollection: tvImageCollection,
        tvLabel: tvLabel,
        tvTitle: tvTitle,
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

class RecommendedForMobile extends StatelessWidget {
  const RecommendedForMobile(
      {Key? key,
      this.width,
      this.tabletImage,
      this.mobileImage,
      this.textLabelForMobile,
      this.festivalTitleForMobile,
      this.festivalTitleForTablet,
      this.title,
      this.tvImageCollection,
      this.tvTitle,
      this.tvLabel})
      : super(key: key);
  final double? width;
  final List<String>? tvImageCollection;
  final String? title,
      tabletImage,
      mobileImage,
      textLabelForMobile,
      festivalTitleForMobile,
      festivalTitleForTablet,
      tvTitle,
      tvLabel;

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
                mainAxisSpacing: 10, crossAxisCount: 1),
            children: [
              LapAdvertise(width: width),
              Column(children: [
                Expanded(
                    child: TabletAdvertise(
                  width: width,
                  fontColor: const Color(0xFF045187),
                  image: mobileImage,
                  textNote: true,
                  note: textLabelForMobile,
                  title: festivalTitleForMobile,
                )),
                const SizedBox(height: 5),
                Expanded(
                    child: TabletAdvertise(
                  width: width,
                  fontColor: const Color(0xFFd1bc19),
                  image: tabletImage,
                  title: festivalTitleForTablet,
                  textNote: false,
                )),
              ]),
              TvAdvertise(
                  width: width,
                  tvImageCollection: tvImageCollection,
                  tvLabel: tvLabel,
                  tvTitle: tvTitle)
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendedForTablet extends StatelessWidget {
  const RecommendedForTablet(
      {Key? key,
      this.width,
      this.tabletImage,
      this.mobileImage,
      this.textLabelForMobile,
      this.festivalTitleForMobile,
      this.festivalTitleForTablet,
      this.title,
      this.tvImageCollection,
      this.tvLabel,
      this.tvTitle})
      : super(key: key);
  final double? width;
  final List<String>? tvImageCollection;
  final String? title,
      tabletImage,
      mobileImage,
      textLabelForMobile,
      festivalTitleForMobile,
      festivalTitleForTablet,
      tvLabel,
      tvTitle;

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
              Expanded(child: LapAdvertise(width: width)),
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
                            child: TabletAdvertise(
                              width: width,
                              fontColor: const Color(0xFF045187),
                              image: mobileImage,
                              textNote: true,
                              note: textLabelForMobile,
                              title: festivalTitleForMobile,
                            ),
                          ),
                          SizedBox(width: width! / 65),
                          Expanded(
                              child: TabletAdvertise(
                            width: width,
                            fontColor: const Color(0xFFd1bc19),
                            image: tabletImage,
                            title: festivalTitleForTablet,
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
                        tvImageCollection: tvImageCollection!,
                        tvLabel: tvLabel,
                        tvTitle: tvTitle,
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
    this.tvTitle,
    this.tvLabel,
    this.tvImageCollection,
  }) : super(key: key);

  final double? width;
  final String? tvTitle, tvLabel;

  Widget superSale() {
    return Text(tvLabel!, //  "Super\nSale",
        textAlign: TextAlign.center,
        style: const TextStyle(
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

  final List<String>? tvImageCollection;
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
        color: const Color(0xFFd4c2f2), //const Color(0xFFb00e5f),
        height: width! * 0.12,
        padding: EdgeInsets.only(bottom: width! < 650 ? 5 : 0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: width! > 649 && width! < 851 ? 22 : 30,
              child: CustomPaint(
                painter: LapHeadDesign(color: const Color(0xFF5e135e)),
                child: Center(
                  child: Text(tvTitle!, //"Every Day New Discount Product",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFFc5c3c7),
                          fontSize: width! > 850 ? 19 : 15,
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
                        children:
                            List.generate(tvImageCollection!.length, (index) {
                          executeTvImageList(index);
                          return index < 2
                              ? Positioned(
                                  left: imagePosition,
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minWidth: minImageWidth),
                                    child: Image.asset(
                                        tvImageCollection![index],
                                        width: imageWidth),
                                  ))
                              : index < 4
                                  ? Positioned(
                                      right: imagePosition,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minWidth: minImageWidth),
                                        child: Image.asset(
                                            tvImageCollection![index],
                                            width: imageWidth),
                                      ))
                                  : Align(
                                      child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(minWidth: 90),
                                        child: Image.asset(
                                            tvImageCollection![index],
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
        ));
  }
}

class TabletAdvertise extends StatelessWidget {
  TabletAdvertise(
      {Key? key,
      required this.width,
      this.textNote = false,
      this.image,
      this.note,
      this.title,
      this.fontColor})
      : super(key: key);

  final double? width;
  final String? image, title;
  bool textNote;
  final String? note;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          bottom: width! > 850 ? 15 : 5, top: 10, left: 5, right: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 110,
                  maxWidth: width! >= 650 && width! < 800 ? 70 : 250),
              child: Image.asset(image!,
                  alignment: Alignment.center, height: width! * 0.14),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: fontColor!,
                    fontSize: width! > 850 ? 16 : 13.5,
                    shadows: const [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color(0xFF242226),
                      ),
                    ],
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              textNote == false
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFdedede)),
                              fixedSize: MaterialStateProperty.all(
                                  Size(width! < 851 ? 65 : 85, 28)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(color: Colors.black)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            Get.to(
                                () => ProductPage(
                                      category: solo.product[2],
                                      width: width,
                                      productItem: 2,
                                      aspectRatio: solo.product[2].aspectRatio,
                                      height: solo.product[2].height,
                                    ),
                                preventDuplicates: false);
                            Get.deleteAll();
                          },
                          child: const Text(
                            "Shoping",
                            style: TextStyle(shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color(0xFF605d5f),
                              ),
                            ], color: Color(0xFF000000)),
                          )),
                    )
                  : SizedBox(
                      width: 50,
                      height: 25,
                      child: CustomPaint(
                        painter: Poster(color: const Color(0xFFbd0f40)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            "Harry Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFFffffff)),
                          ),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

class LapAdvertise extends StatelessWidget {
  const LapAdvertise({Key? key, this.width}) : super(key: key);
  final double? width;
  double get respnseveFont {
    return width! < 750 ? 17 : 20;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffbabad1),
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      child: Image.asset("assets/advertise/macbook-pro.png",
                          width: width! * 0.10),
                    )),
                Positioned(
                    right: 10,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Image.asset(
                          "assets/advertise/laptop-advertise1.png",
                          width: width! * 0.10),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 120),
                      child: Image.asset("assets/advertise/lenovo-l340.png",
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
