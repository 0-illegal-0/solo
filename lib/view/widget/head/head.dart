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
  const Head({
    Key? key,
    this.width,
    this.controller,
  }) : super(key: key);
  final double? width;
  final Cart? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 0.8),
            color: const Color(0xFF078fa3),
            height: device == DeviceType.Desktop
                ? 115
                : device == DeviceType.Tablet
                    ? 125
                    : 90,
            width: double.infinity,
            child: width! >= 800
                ? DesktopHead(width: width!, space: 75, controller: controller)
                : width! < 800 && width! >= 650
                    ? TabletHead(width: width!, space: 55)
                    : MobileHead(
                        space: width! / 10.8,
                        width: width!,
                      )),
        SizedBox(
            width: double.infinity,
            height: device == DeviceType.Desktop
                ? 17
                : device == DeviceType.Tablet
                    ? 18
                    : 13,
            child: CustomPaint(
                painter: CurvePainter2(color: const Color(0xFF13a7bd)))),
      ],
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Logo(fontSize: 35),
            const SizedBox(width: 15),
            Search(
              fieldHeight: 32,
              iconButtonheight: 33,
              width: width,
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        const Spacer(),
        Container(
          color: const Color(0xFF13a7bd),
          width: double.infinity,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 27,
                padding: const EdgeInsets.only(left: 10),
                child: CategoriesHeader(
                  aspectRatio: aspectRatio,
                  space: space,
                  width: width,
                ).categoriesRow(),
              )),
        )
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
  const TabletHead(
      {Key? key, this.width, this.space, this.aspectRatio, this.height})
      : super(key: key);
  final double? width, space, aspectRatio, height;
  // final Cart? controller;

  @override
  Widget build(BuildContext context) {
    Cart controller = Get.put(Cart());
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
                          Get.to(() => const Login(), preventDuplicates: false);
                          Get.deleteAll();
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
              const Logo(fontSize: 33),
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
        const Spacer(),
        Container(
          color: const Color(0xFF13a7bd),
          child: CategoriesHeader(
            width: width,
            space: space!,
            aspectRatio: aspectRatio,
          ),
        ),
      ],
    );
  }
}

class DesktopHead extends StatelessWidget {
  const DesktopHead({Key? key, this.width, this.space, this.controller})
      : super(key: key);
  final double? width, space;
  final Cart? controller;

  double get gap {
    return width! / 36;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(fontSize: 40),
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
        const Spacer(),
        CategoriesHeader(width: width, space: space!),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.fontSize,
  }) : super(key: key);
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        onPressed: () {
          Get.to(() => HomePage());
        },
        child: Text("Solo",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Lobster",
                fontSize: fontSize!,
                color: Colors
                    .white))); /*Text(
      "Solo",
      style: TextStyle(
          fontFamily: "Lobster", fontSize: fontSize!, color: Colors.white),
    );*/
  }
}

class GetSupport extends StatelessWidget {
  const GetSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
