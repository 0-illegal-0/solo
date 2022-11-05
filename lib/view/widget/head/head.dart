import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/screens/login_register/login.dart';
import 'package:solo/view/widget/head/components/category_header.dart';
import 'package:solo/view/widget/head/components/curve_painter.dart';
import 'package:solo/view/widget/head/components/delivery_head.dart';
import 'package:solo/view/widget/head/components/head_icons.dart';
import 'package:solo/view/widget/head/components/search.dart';
import '../note.dart';

class Head extends StatelessWidget {
  Head({
    Key? key,
    this.width,
    this.controller,
    this.logoName,
    this.y,
  }) : super(key: key) {
    if (Logo.logo == null && logoName != null) {
      Logo.logo = logoName;
    }
    print("Logo --------------------- ${Logo.logo}");
  }
  final double? width;
  final Cart? controller;
  final String? logoName;
  final String? y;

  double heightHead = 108;
  double topPosition = 88;
  double heightCurve = 13;

  categoryBar() {
    if (device == DeviceType.Desktop) {
      heightHead = 140;
      topPosition = 115;
      heightCurve = 17;
    } else if (device == DeviceType.Tablet) {
      heightHead = 135;
      topPosition = width! >= 650 && width! < 800 ? 112 : 115;
      heightCurve = 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    categoryBar();

    return SizedBox(
      height: heightHead,
      child: Stack(
        children: [
          Positioned(
            top: topPosition,
            child: SizedBox(
                width: width,
                height: 18,
                child: CustomPaint(
                    painter: CurvePainter2(color: const Color(0xFF168994)))),
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 0.8),
                  color: const Color(0xFF168994),
                  width: double.infinity,
                  child: width! >= 800
                      ? DesktopHead(
                          width: width!,
                          space: 75,
                          y: y,
                          controller: controller,
                        )
                      : width! < 800 && width! >= 650
                          ? TabletHead(width: width!, space: 55)
                          : MobileHead(
                              space: width! / 10.8,
                              width: width!,
                            )),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileHead extends StatelessWidget {
  const MobileHead({
    Key? key,
    this.space,
    this.width,
    this.aspectRatio,
    this.height,
  }) : super(key: key);
  final double? space, width, aspectRatio, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Logo(fontSize: 35),
            const SizedBox(width: 15),
            Search(
              fieldHeight: 32,
              iconButtonheight: 33,
              width: width,
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 5),
        //const Spacer(),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoriesHeader(
                aspectRatio: aspectRatio,
                space: space,
                width: width,
              ),
            ))
      ],
    );
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 100,
              color: Colors.white,
              child: const Text("empty"),
            ));
  }
}

class TabletHead extends StatelessWidget {
  const TabletHead({
    Key? key,
    this.width,
    this.space,
    this.aspectRatio,
    this.y,
    this.height,
  }) : super(key: key);
  final double? width, space, aspectRatio, height;
  final String? y;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        width! < 800
            ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 32,
                      child: IconButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        onPressed: () {
                          Get.deleteAll();
                          Get.to(() => const Login(), preventDuplicates: false);
                        },
                        icon: Row(
                          children: const [
                            Icon(Icons.person_outline_outlined,
                                size: 22, color: Color(0xFFffffff)),
                            SizedBox(width: 5),
                            Text("Sign In")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 65,
                      height: 32,
                      child: IconButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        onPressed: () {
                          note(context);
                        },
                        icon: Row(
                          children: const [
                            Icon(Icons.help_outline_outlined,
                                size: 22, color: Color(0xFFffffff)),
                            SizedBox(width: 5),
                            Text("Help")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(fontSize: 33, y: y),
              const SizedBox(width: 30),
              Search(width: width, fieldHeight: 32, iconButtonheight: 33),
              const SizedBox(width: 30),
              const DeliveryHead(height: 33, width: 144),
              const SizedBox(width: 30),
              const HeadIcons(
                      height: 42,
                      width: 47,
                      iconSize: 22,
                      rowWidth: 170,
                      textIconSize: 13)
                  .iconBar("Cart", Icons.shopping_cart_outlined,
                      page: CartBudget(), pageState: "CART")
            ],
          ),
        ),
        //  const Spacer(),
        SizedBox(
          child: CategoriesHeader(
            width: width,
            space: space!,
            aspectRatio: aspectRatio,
          ),
        ),
        // const SizedBox(height: 5)
      ],
    );
  }
}

class DesktopHead extends StatelessWidget {
  const DesktopHead({Key? key, this.width, this.space, this.controller, this.y})
      : super(key: key);
  final double? width, space;
  final Cart? controller;
  final String? y;

  double get gap {
    return width! / 36;
  }

  @override
  Widget build(BuildContext context) {
    print("Tableeeeeeeeeeeeeeeeeeeeeeeet");
    return Column(
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(fontSize: 50, y: y),
              SizedBox(width: gap),
              Search(width: width, fieldHeight: 39, iconButtonheight: 40),
              SizedBox(width: gap),
              const DeliveryHead(height: 40, width: 144),
              SizedBox(width: gap),
              HeadIcons(
                  height: 50,
                  width: 52,
                  iconSize: 25,
                  controller: controller,
                  rowWidth: width! < 1100 ? 180 : 200,
                  textIconSize: 15)
            ],
          ),
        ),
        // const Spacer(),
        CategoriesHeader(width: width, space: space!),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.y,
    this.fontSize,
    this.logoName,
  }) : super(key: key);

  final double? fontSize;
  final String? logoName;
  static String? logo;
  final String? y;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
            onPressed: () {
              Get.deleteAll();
              Get.to(() => const HomePage());
            },
            child: Text(logo!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Sansita",
                    fontSize: fontSize!,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color(0xFFbdbdcd),
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color(0xFFbdbdcd),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationColor: const Color(0XFF806615),
                    color: const Color(0xFF960740)))), // 0xFF700741
        const SizedBox(height: 13)
      ],
    );
  }
}

class GetSupport extends StatelessWidget {
  const GetSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
