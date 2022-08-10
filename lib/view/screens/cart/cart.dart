import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/view_details_controller.dart';
import 'package:solo/models/tablet_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/widget/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/view_item.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("${tablets.length}......");
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
                        ? ViewItem(
                            aspectRatioMobile: 0.9,
                            height: width * 0.60,
                            itemList: tablets,
                            mainPadding: width / 24,
                            title: "Mobiles",
                            numberOfRows: 1,
                            aspectRatioNoMobile: 0.8,
                            width: width,
                            i: 6,
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
