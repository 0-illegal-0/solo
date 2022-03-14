import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solo/constants/constants.dart';
import 'package:solo/view/screens/home/components/advertisement/advertisement.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deals.dart';
import 'package:solo/view/screens/home/components/top_categories/top_categories.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // ForTest controller = Get.put(ForTest(), permanent: false);
    double mainPadding = width / 24;
    //controller.call();
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Head(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: mainPadding, left: mainPadding, top: 120),
                    child: Column(
                      children: [
                        Advertisement(
                          width: width,
                          title: "",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TopCategories(
                          width: width,
                          crossAxisCount: 4,
                          title: "Top Categories",
                          mainPadding: mainPadding,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        HotDeals(
                          mainPadding: mainPadding,
                          width: width,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
