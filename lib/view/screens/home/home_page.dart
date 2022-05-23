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
    double mainPadding = width / 24;
    getDevice(width);
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Head(
                    width: width,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: mainPadding, left: mainPadding, top: 120),
                    child: Column(
                      children: [
                        /*  Advertisement(
                          width: width,
                          title: "",
                          mainPadding: mainPadding,
                        ),
                        SizedBox(height: width / 20),*/
                        /*TopCategories(
                          width: width,
                          crossAxisCount: 4,
                          title: "Top Categories",
                          mainPadding: mainPadding,
                        ),*/
                        /*  HotDeals(
                          mainPadding: mainPadding,
                          width: width,
                          // maxItemCount: 20,
                          title: "Hot Deals",
                          crossAxisCount: 5,
                        ),*/
                        /*  SizedBox(height: width / 20),
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
                        SizedBox(height: width / 20),
                        const SizedBox(height: 30),
                       SpecialOffer(
                          width: width,
                          mainPadding: mainPadding,
                        ),
                        SizedBox(height: width / 20),
                        TopBrand(
                            mainPadding: mainPadding,
                            spacing: width / 18,
                            runSpacing: width / 18,
                            width: width,
                            title: "Top Brands"),*/
                        /*  SizedBox(height: width / 20),
                        WeeklyGift(title: "Weekly Gift", width: width),
                        SizedBox(height: width / 20),
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
                        const SizedBox(height: 30),*/
                        /*    Recommended(
                          width: width,
                          recomendedList: recomendedList,
                        ),
                        const SizedBox(height: 30),
                        MostLiked(
                          width: width,
                          mainPadding: mainPadding,
                          space: width / 51.4,
                          // countItem: 2,
                          title: "Most Liked Items",
                        ),*/
                        /* const SizedBox(height: 30),
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
                        const SizedBox(height: 30),
                        LatestItems(
                          width: width,
                          latestItems: latestItems,
                          space: 5,
                          mainPadding: mainPadding,
                          title: "Latest Item",
                          aspectRatio: 1.1,
                          viewitemCount: 5,
                          height: width * 0.50,
                        ),
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 20),
                        Gift(
                          title: "Get a Gift",
                          width: width,
                        ),
                        const SizedBox(height: 30),*/
                        /* CameraeView(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.8,
                          height: width * 0.50,
                          itemCount: cameras.length,
                          itemList: cameras,
                          mainPadding: mainPadding,
                          title: "Cameras",
                          width: width,
                          numberOfRows: 2,
                        ),*/
                        /*  const SizedBox(height: 20),
                        TopSale(
                          title: "Top Sale",
                          width: width,
                          itemCountForTablet: 2,
                          mainPadding: mainPadding,
                          itemCountForDesktop: 3,
                          space: 10,
                        ),
                        const SizedBox(height: 30),
                        Fotter(
                          width: width,
                        )*/
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

//---------------Fotter----------------

class Fotter extends StatelessWidget {
  const Fotter({Key? key, this.width}) : super(key: key);
  final double? width;

  Widget socialMediaIcon(double? height, String? image) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Image.asset(
          image!,
          height: height,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FotterItems(
              rowWidth: 266,
              item: socialMedia,
              height: 30,
              title: "Social Media",
              titleWidth: 110,
              maxWidthState: false,
            ),
            FotterItems(
              rowWidth: 280,
              item: application,
              height: 40,
              title: "Download application",
              titleWidth: 165,
              maxWidthState: false,
            ),
            FotterItems(
              rowWidth: 350,
              item: payment,
              height: 40,
              title: "Payment Gatways",
              titleWidth: 165,
              maxWidthState: true,
            ),
          ],
        ),
        const SizedBox(height: 7),
        const Divider(thickness: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("© 2022 Solo. All rights reserved."),
            SizedBox(
              width: 600,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      stringFotterList.length,
                      (index) => TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0))),
                            child: Text(
                              stringFotterList[index],
                              style: const TextStyle(fontSize: 13),
                            ),
                          ))),
            )
          ],
        )
      ],
    );
  }
}

List<String> stringFotterList = [
  "Careers",
  "Warranty Policy",
  "Sell with us",
  "Terms of Use",
  "Terms of Sale",
  "Privacy Policy"
];

class FotterItems extends StatelessWidget {
  const FotterItems({
    Key? key,
    this.rowWidth,
    this.item,
    this.height,
    this.title,
    this.titleWidth,
    this.maxWidthState,
  }) : super(key: key);
  final double? rowWidth, height, titleWidth;
  final List? item;
  final String? title;
  final bool? maxWidthState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: rowWidth,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
            decoration: BoxDecoration(
              //  color: Colors.yellow,
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    item!.length,
                    (index) => Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0))),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: 35,
                                        minHeight: 35,
                                        maxWidth: maxWidthState == true
                                            ? 70
                                            : double.infinity),
                                    child: Container(
                                      child: Image.asset(
                                        item![index],

                                        // height: height!,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ))),
          ),
          Positioned(
            top: 11,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: titleWidth!,
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> socialMedia = [
  "assets/images/social-media-icon/twitter.png",
  "assets/images/social-media-icon/facebook.png",
  "assets/images/social-media-icon/Instagram.png",
  "assets/images/social-media-icon/youtube.png"
];

List<String> application = [
  "assets/images/app-store-icons/google-store.png",
  "assets/images/app-store-icons/apple-store.png",
];

List<String> payment = [
  "assets/images/payment-icons/master-card.png",
  "assets/images/payment-icons/paypal-logo.png",
  "assets/images/payment-icons/visa.png",
  "assets/images/payment-icons/skrill.png"
];
