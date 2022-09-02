import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/controllers/navigation-state.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:solo/view/screens/login_register/login.dart';
import 'package:solo/view/screens/privacy/privacy_policy.dart';
import 'package:solo/view/widget/important.dart';
import 'package:solo/view/widget/note.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({
    Key? key,
  }) : super(key: key);

  NavigationState controller3 = Get.put(NavigationState(), permanent: false);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<NavigationState>(
      builder: (controller3) => BottomNavigationBar(
          currentIndex: controller3.change3(),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          selectedIconTheme: const IconThemeData(color: Colors.green),
          unselectedIconTheme: const IconThemeData(),
          onTap: (val) {
            if (bottomNavDetails[val]["title"] == "More") {
              bottomSheet(context, width);
            } else if (bottomNavDetails[val]["title"] == "Categories") {
              note(context);
            } else {
              Get.to(bottomNavDetails[val]["page"], preventDuplicates: false);
              Get.deleteAll();
            }
          },
          items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
              icon: bottomNavDetails[index]["icon"],
              label: bottomNavDetails[index]["title"],
            ),
          )),
    );
  }

  bottomSheet(context, width) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => More(
              width: width,
            ));
  }
}

class More extends StatelessWidget {
  More({Key? key, this.width}) : super(key: key);
  final double? width;
  double? heightSheet, space;
  int? count = 2;

  setData() {
    if (width! < 451) {
      count = 1;
      heightSheet = 330;
      space = 0;
    } else {
      heightSheet = 200;
      space = 15;
    }
  }

  double get itemWidth {
    return (width! - 15 * 2 - space!) / count!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    setData();

    return Container(
      height: heightSheet,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0xFFb1b3b5),
            blurRadius: 5,
            spreadRadius: 0.1,
            offset: Offset(0, 0))
      ]),
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Wrap(
          spacing: space!,
          runSpacing: 15,
          children: List.generate(
            bottomNavDetails[3]["drop-menu"].length,
            (index) => TextButton(
              onPressed: () {
                Get.to(bottomNavDetails[3]["drop-menu"][index]["page"]);
                Get.deleteAll();
              },
              child: Text(
                bottomNavDetails[3]["drop-menu"][index]["title"],
                style: const TextStyle(color: Color(0xFFffffff)),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF03a7bd)),
                  fixedSize: MaterialStateProperty.all(Size(itemWidth, 40))),
            ),
          )),
    );
  }
}

List<Map<String, dynamic>> bottomNavDetails = [
  {
    "title": "Home",
    "icon": const Icon(Icons.home_outlined),
    "page": const HomePage()
  },
  {
    "title": "Important",
    "icon": const ImportantButton(),
    "page": const HomePage()
  },
  {
    "title": "Cart",
    "icon": const Icon(Icons.shopping_cart_outlined),
    "page":  CartBudget()
  },
  {
    "title": "More",
    "icon": const Icon(
      Icons.more_outlined,
    ),
    "drop-menu": [
      {"title": "Log In", "page": const Login()},
      {"title": "Help", "page": const Progress()},
      {"title": "Contact Us", "page": const Progress()},
      {"title": "About Us", "page": const Progress()},
      {"title": "Privacy Policy", "page": const PrivacyPolicy()}
    ]
  },
];

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: const Text(
          "In Progress",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}

class ImportantButton extends StatelessWidget {
  const ImportantButton({Key? key, this.width}) : super(key: key);
  final double? width;
  importantNote(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Ink(
              padding: const EdgeInsets.all(8),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Fornt-End : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFFc20e32))),
                        Text("99% completed", style: TextStyle(fontSize: 22))
                      ]),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Back-End : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFFc20e32))),
                        Text("In Progress", style: TextStyle(fontSize: 22))
                      ]),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ChangeColor controller = Get.put(ChangeColor());

    return InkWell(onTap: () {
      importantNote(context);
    }, child: GetBuilder<ChangeColor>(builder: (context) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: controller.styleColor,
          width: 100,
          height: 40,
          child: const Center(
              child: Text("Important",
                  style: TextStyle(fontWeight: FontWeight.bold))));
    }));
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({Key? key, this.controller}) : super(key: key);
  final Cart? controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return device == DeviceType.Desktop
        ? const SizedBox()
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFf7f7f7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    4,
                    (index) => InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              bottomNavDetails[index]["icon"],
                              bottomNavDetails[index]["title"] == "Important"
                                  ? const SizedBox()
                                  : Text(bottomNavDetails[index]["title"],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                            ],
                          ),
                          onTap: () async{
                            if (bottomNavDetails[index]["title"] == "More") {
                              bottomSheet(context, width);
                            } else if(bottomNavDetails[index]["title"] ==
                                "Cart"){
                                Cart controller = Get.put(Cart());
                              await controller.showItem();
                              Get.to(CartBudget());

                                print(controller.items.length);
                            }
                            else if (bottomNavDetails[index]["title"] ==
                                "Categories") {
                              note(context);
                            } else {
                              Get.to(bottomNavDetails[index]["page"],
                                  preventDuplicates: false);
                              Get.deleteAll();
                            }
                          },
                        )),
              ),
            ),
          );
  }

  bottomSheet(context, width) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => More(
              width: width,
            ));
  }
}
