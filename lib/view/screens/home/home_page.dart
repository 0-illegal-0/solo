import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/television_models.dart';
import 'package:solo/view/screens/home/components/advertisement/advertisement.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deals.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer.dart';
import 'package:solo/view/screens/home/components/top-brands/top_brands.dart';
import 'package:solo/view/screens/home/components/top_categories/top_categories.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/view_item.dart';
import 'components/most liked items/most_liked_items.dart';
import 'components/recommended/recommended.dart';
import 'components/weeklyGift/weekly_gift.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double mainPadding = width / 24;
    return Scaffold(
        backgroundColor: Colors.white,
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
                        const SizedBox(height: 20),
                        TopCategories(
                          width: width,
                          crossAxisCount: 4,
                          title: "Top Categories",
                          mainPadding: mainPadding,
                        ),
                        const SizedBox(height: 30),
                        HotDeals(
                          mainPadding: mainPadding,
                          width: width,
                          maxItemCount: 6,
                          title: "Hot Deals",
                          crossAxisCount: 3,
                        ),
                        const SizedBox(height: 30),
                        ViewItem(
                          title: "Mobiles",
                          itemList: mobiles,
                          aspectRatio: 0.6,
                          width: width,
                          height: width * 0.69,
                          itemCount: mobiles.length,
                        ),
                        const SizedBox(height: 30),
                        SpecialOffer(
                          width: width,
                          mainPadding: mainPadding,
                        ),
                        const SizedBox(height: 30),
                        TopBrand(
                            countItem: 4,
                            mainPadding: mainPadding,
                            spacing: width / 18,
                            runSpacing: width / 18,
                            width: width,
                            title: "Top Brands"),
                        const SizedBox(height: 30),
                        WeeklyGift(title: "Weekly Gift", width: width),
                        const SizedBox(height: 30),
                        ViewItem(
                          title: "Laptops",
                          itemList: laptops,
                          width: width,
                          height: width * 0.60,
                          itemCount: laptops.length,
                          aspectRatio: 1,
                        ),
                        const SizedBox(height: 30),
                        const Recommended(),
                        const SizedBox(height: 30),
                        MostLiked(
                          width: width,
                          mainPadding: mainPadding,
                          space: 7,
                          countItem: 2,
                          title: "Most Liked Items",
                        ),
                        const SizedBox(height: 30),
                        ViewItem(
                          title: "Televisions",
                          itemList: televisions,
                          width: width,
                          height: width * 0.60,
                          itemCount: televisions.length,
                          aspectRatio: 1.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
