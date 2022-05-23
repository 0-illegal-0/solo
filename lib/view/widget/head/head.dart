import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/constants/constants.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/widget/head/components/curve_painter.dart';
import 'package:solo/view/widget/head/components/search_app.dart';

class Head extends StatelessWidget {
  Head({
    Key? key,
    this.width,
  }) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    print(device);
    print(width!);
    return Stack(
      children: [
        Container(
          //alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          child: CustomPaint(
            painter: CurvePainter(color: const Color(0xFF13a7bd)),
          ),
        ),
        Container(
          color: const Color(0xFF078fa3),
          height: 115,

          width: double.infinity,
          child: /*CustomPaint(
              painter: CurvePainter(color: const Color(0xFF078fa3)),
              child:*/
              device == DeviceType.Desktop
                  ? DesktopHead(width: width!)
                  : const MobileHead(), //),
        ),
      ],
    );
  }
}

class DesktopHead extends StatelessWidget {
  const DesktopHead({Key? key, this.width}) : super(key: key);
  final double? width;

  Widget iconBar(String? title, IconData? icon) {
    return SizedBox(
      height: 50,
      width: 52,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        tooltip: title,
        onPressed: () {},
        icon: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Icon(icon, size: 25, color: const Color(0xFFffffff)),
              SizedBox(
                height: 20,
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFffffff)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(),
              const SizedBox(width: 40),
              Search(width: width),
              const SizedBox(width: 40),
              Container(
                width: 138,
                height: 40,
                alignment: Alignment.center,
                color: const Color(0xFFcedcde), //d3dadb
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Delivery:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)),
                          ),
                          Text(
                            " Cairo",
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color(0xFF000000),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 40),
              SizedBox(
                width: 220,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconBar("Sign In", Icons.person_outline_outlined),
                    iconBar("Help", Icons.help_outline_outlined),
                    iconBar("Cart", Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 35,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xFF13a7bd),
          child: const CategoriesHeader(),
        ),
      ],
    );
  }
}

class MobileHead extends StatelessWidget {
  const MobileHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: SearchApp(),
                      useRootNavigator: true);
                },
                icon: const Icon(Icons.search_outlined)),
            Container(
                margin: const EdgeInsets.only(left: 0, right: 10),
                child: IconButton(
                  onPressed: () {
                    bottomSheet(context);
                  },
                  icon: const Icon(Icons.more_horiz_outlined),
                )),
          ],
        ),
        const Logo(),
      ],
    );
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 100,
              color: Colors.white,
              child: const Text("empety"),
            ));
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Solo",
      style:
          TextStyle(fontFamily: "Lobster", fontSize: 40, color: Colors.white),
    );
  }
}

class Search extends StatelessWidget {
  Search({Key? key, this.width}) : super(key: key);
  String val = '';
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800), //760
          child: Row(
            children: [
              const Test(),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabled: true,
                    filled: true,
                    fillColor: Colors.white,
                    constraints: BoxConstraints(maxHeight: 39),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xFFffffff), width: 3),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 30),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xFFffffff), width: 0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              //Color(0xFFdae2e3  const Color(0xFFd7d9db)
              Container(
                color: const Color(0xFFcedcde),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  TestState createState() => TestState();
}

var di = false;
var forTit = 'hello Every body';
var kit = 'coca cola';

class TestState extends State<Test> {
  var defult = "Categories";
  var defult2 = 'hello';
  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsets.only(top: 0.7),
      padding: const EdgeInsets.only(left: 10),
      width: 118,
      decoration: const BoxDecoration(
          color: Color(0xFFcedcde),
          border: Border(
            right: BorderSide(color: Colors.black, width: 1.0),
          )),
      height: 40,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          items: ["white", "blue", "red", "yellow"]
              .map(
                (v) => DropdownMenuItem(
                  child: Text(v),
                  value: v,
                ),
              )
              .toList(),
          hint: Text(defult),
          onChanged: (val) {
            setState(
              () {
                defult = val as String;
              },
            );
          },
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.white,
          iconEnabledColor: const Color(0xFF0a0a0a),
          iconSize: 30,
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
          ),
          onTap: () {
            setState(
              () {
                defult2 = 'soliman';
              },
            );
            print(defult2);
          },
          //value: defult,
        ),
      ),
    );
  }
}

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({Key? key}) : super(key: key);

  static const List topCategories = [
    "Mobiles",
    "Tablets",
    "Laptops",
    "Cameras",
    "Televisions"
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          topCategories.length,
          (index) => Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0))),
                    onPressed: () {
                      Get.to(() {
                        // const ShowItems();
                      });
                    },
                    child: Row(
                      children: [
                        Text(topCategories[index],
                            style: const TextStyle(
                                color: Color(0xFFffffff), fontSize: 15)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 75)
                ],
              )),
    );
  }
}

class ShowItems extends StatelessWidget {
  const ShowItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GetSupport extends StatelessWidget {
  const GetSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
