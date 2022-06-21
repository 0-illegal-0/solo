import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/latest_item_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/recommended_models.dart';
import 'package:solo/models/tablet_models.dart';
import 'package:solo/models/television_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/screens/fotter/fotter.dart';
import 'package:solo/view/screens/home/components/gift/gift.dart';
import 'package:solo/view/screens/home/components/laptops.dart/laptop.dart';
import 'package:solo/view/screens/home/components/latest_item/latest_items.dart';
import 'package:solo/view/screens/home/components/mobiles/mobile.dart';
import 'package:solo/view/screens/home/components/recommended/recommended.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer.dart';
import 'package:solo/view/screens/home/components/tablet/tablet.dart';
import 'package:solo/view/screens/home/components/televisions/televisions.dart';
import 'package:solo/view/screens/home/components/top-sale/top_sale.dart';
import 'package:solo/view/screens/home/components/weeklyGift/weekly_gift.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/start_page.dart';
import 'components/advertisement/advertisement.dart';
import 'components/camera/camera.dart';
import 'components/hot_deals/hot_deals.dart';
import 'components/most liked items/most_liked_items.dart';
import 'components/top-brands/top_brands.dart';
import 'components/top_categories/top_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double mainPadding = width / 24;
    getDevice(width);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: mainPadding,
                        left: mainPadding,
                        top: device == DeviceType.Mobile
                            ? 115
                            : device == DeviceType.Tablet
                                ? 155
                                : 140),
                    child: Column(
                      children: [
                        Advertisement(
                          width: width,
                          title: "",
                          mainPadding: mainPadding,
                        ),
                        SizedBox(height: width / 15),
                        HotDeals(
                          mainPadding: mainPadding,
                          width: width,
                          maxItemCount: 20,
                          title: "Hot Deals",
                          crossAxisCount: 5,
                        ),
                        SizedBox(height: width / 15),
                        MobileView(
                          aspectRatioMobile: 0.9,
                          height: width * 0.60,
                          itemCount: mobiles.length,
                          itemList: mobiles,
                          mainPadding: mainPadding,
                          title: "Mobiles",
                          numberOfRows: 2,
                          aspectRatioNoMobile: 0.8,
                          width: width,
                        ),
                        SizedBox(height: width / 15),
                        const SizedBox(height: 30),
                        SpecialOffer(
                          width: width,
                          mainPadding: mainPadding,
                        ),
                        SizedBox(height: width / 15),
                        WeeklyGift(title: "Weekly Gift", width: width),
                        SizedBox(height: width / 15),
                        LaptopeView(
                          aspectRatioMobile: 0.9,
                          aspectRatioNoMobile: 0.7,
                          height: width * 0.55,
                          itemCount: laptops.length,
                          itemList: laptops,
                          mainPadding: mainPadding,
                          title: "Laptops",
                          width: width,
                          numberOfRows: 2,
                        ),
                        SizedBox(height: width / 15),
                        Recommended(width: width, title: "Recommended"),
                        SizedBox(height: width / 15),
                        MostLiked(
                          width: width,
                          mainPadding: mainPadding,
                          space: width / 51.4,
                          title: "Most Liked Items",
                        ),
                        SizedBox(height: width / 15),
                        TelevisionsView(
                          aspectRatioMobile: 1.2,
                          aspectRatioNoMobile: 0.7,
                          height: width * 0.50,
                          itemCount: televisions.length,
                          itemList: televisions,
                          mainPadding: mainPadding,
                          title: "Televisions",
                          width: width,
                          numberOfRows: 2,
                        ),
                        SizedBox(height: width / 15),
                        LatestItems(
                          width: width,
                          space: 5,
                          mainPadding: mainPadding,
                          title: "Latest Item",
                          aspectRatio: 1.1,
                          viewitemCount: 5,
                          height: width * 0.50,
                        ),
                        SizedBox(height: width / 15),
                        TopBrand(
                            mainPadding: mainPadding,
                            spacing: width / 18,
                            runSpacing: width / 18,
                            width: width,
                            title: "Top Brands"),
                        SizedBox(height: width / 15),
                        TableteView(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.7,
                          height: width * 0.50,
                          itemCount: tablets.length,
                          itemList: tablets,
                          mainPadding: mainPadding,
                          title: "Tablets",
                          width: width,
                          numberOfRows: 2,
                        ),
                        SizedBox(height: width / 15),
                        Gift(
                          title: "Get a Gift",
                          width: width,
                        ),
                        SizedBox(height: width / 15),
                        CameraeView(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.8,
                          height: width * 0.50,
                          itemCount: cameras.length,
                          itemList: cameras,
                          mainPadding: mainPadding,
                          title: "Cameras",
                          width: width,
                          numberOfRows: 2,
                        ),
                        SizedBox(height: width / 15),
                        TopSale(
                          title: "Top Sale",
                          width: width,
                          itemCountForTablet: 2,
                          mainPadding: mainPadding,
                          itemCountForDesktop: 3,
                          space: 10,
                        ),
                        SizedBox(height: width / 15),
                        Fotter(width: width)
                      ],
                    ),
                  ),
                ),
                Head(width: width),
                const BottomRow(),
                /*    device == DeviceType.Desktop
                    ? const SizedBox()
                    : StartPages(height: height, width: width)*/
              ],
            )));
  }
}
