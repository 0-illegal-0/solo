import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solo/controllers/add_data.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/home/components/gift/gift.dart';
import 'package:solo/view/screens/home/components/latest_item/latest_items.dart';
import 'package:solo/view/screens/home/components/recommended/recommended.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer.dart';
import 'package:solo/view/screens/home/components/top-sale/top_sale.dart';
import 'package:solo/view/screens/home/components/weeklyGift/weekly_gift.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/important.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/start_page.dart';
import 'package:solo/view/widget/view_item.dart';
import 'components/advertisement/advertisement.dart';
import 'components/hot_deals/hot_deals.dart';
import 'components/most liked items/most_liked_items.dart';
import 'components/top-brands/top_brands.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    AllData inst = AllData(context: context);
    print(inst.width);
    return Scaffold(
        backgroundColor: const Color(0xFFe1e1e3),
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: inst.mainPadding!,
                        left: inst.mainPadding!,
                        top: device == DeviceType.Mobile
                            ? 115
                            : device == DeviceType.Tablet
                                ? 155
                                : 140),
                    child: Column(
                      children: [
                        Advertisement(
                          width: inst.width,
                          title: "",
                          mainPadding: inst.mainPadding!,
                        ),
                        /* SizedBox(height: inst.verticalSpace),
                        HotDeals(
                          mainPadding: inst.mainPadding!,
                          width: inst.width,
                          title: "Hot Deals",
                          data: inst.itemData["hot-deal"],
                        ),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 0.9,
                          height: inst.width! * 0.60,
                          itemList: solo.product[1].products,
                          mainPadding: inst.mainPadding!,
                          title: "Mobiles",
                          numberOfRows: 2,
                          aspectRatioNoMobile: 0.7,
                          width: inst.width!,
                          i: 0,
                          productItem: 1,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        SpecialOffer(
                            width: inst.width!,
                            mainPadding: inst.mainPadding!,
                            data: inst.itemData["special-offer"]),
                        SizedBox(height: inst.verticalSpace),*/
                        // WeeklyGift(title: "Weekly Gift", width: inst.width!),
                        /* SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 0.9,
                          aspectRatioNoMobile: 0.7,
                          height: inst.width! * 0.55,
                          itemList: solo.product[0].products,
                          mainPadding: inst.mainPadding!,
                          title: "Laptops",
                          width: inst.width!,
                          numberOfRows: 2,
                          i: 1,
                          productItem: 0,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Recommended(
                            width: inst.width!,
                            title: "Recommended",
                            data: inst.itemData["recomended"]),
                        SizedBox(height: inst.verticalSpace),
                        MostLiked(
                          width: inst.width!,
                          mainPadding: inst.mainPadding!,
                          space: inst.width! / 51.4,
                          title: "Most Liked Items",
                          data: inst.itemData["liked"],
                        ),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 1.2,
                          aspectRatioNoMobile: 0.7,
                          height: inst.width! * 0.50,
                          itemList: solo.product[3].products,
                          mainPadding: inst.mainPadding!,
                          title: "Televisions",
                          width: inst.width!,
                          i: 2,
                          numberOfRows: 2,
                          productItem: 3,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        LatestItems(
                          width: inst.width!,
                          space: 5,
                          mainPadding: inst.mainPadding!,
                          title: "Latest Item",
                          aspectRatio: 0.8,
                          viewitemCount: 5,
                          height: inst.width! * 0.50,
                          data: inst.itemData["latest-item"],
                        ),
                        SizedBox(height: inst.verticalSpace),
                        TopBrand(
                            mainPadding: inst.mainPadding!,
                            spacing: inst.width! / 18,
                            runSpacing: inst.width! / 18,
                            width: inst.width!,
                            title: "Top Brands"),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.7,
                          height: inst.width! * 0.50,
                          itemList: solo.product[2].products,
                          mainPadding: inst.mainPadding!,
                          title: "Tablets",
                          width: inst.width!,
                          numberOfRows: 2,
                          i: 3,
                          productItem: 2,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Gift(title: "Get a Gift", width: inst.width!),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.8,
                          height: inst.width! * 0.50,
                          itemList: solo.product[4].products,
                          mainPadding: inst.mainPadding!,
                          title: "Cameras",
                          width: inst.width!,
                          i: 4,
                          numberOfRows: 2,
                          productItem: 4,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        TopSale(
                          title: "Top Sale",
                          width: inst.width!,
                          itemCountForTablet: 2,
                          mainPadding: inst.mainPadding!,
                          itemCountForDesktop: 3,
                          space: 10,
                          data: inst.itemData["latest-item"],
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Close(width: inst.width!),
                        device == DeviceType.Tablet
                            ? const SizedBox(height: 120)
                            : const SizedBox()*/
                      ],
                    ),
                  ),
                ),
                Head(width: inst.width),
                /*   const BottomRow(),
                const Important(),
                StartPages(height: inst.height!, width: inst.width)*/
              ],
            )));
  }
}
