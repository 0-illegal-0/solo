import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solo/controllers/add_data.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/sliders.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/cart/cart_budget.dart';
import 'package:solo/view/screens/home/components/deal_festival/deal_festival.dart';
import 'package:solo/view/screens/home/components/gift/gift.dart';
import 'package:solo/view/screens/home/components/latest_item/latest_items.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer.dart';
import 'package:solo/view/screens/home/components/weeklyGift/weekly_gift.dart';
import 'package:solo/view/screens/login_register/login.dart';
import 'package:solo/view/screens/privacy/privacy_policy.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
//import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/important.dart';
import 'package:solo/view/widget/left_side_element.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/show_item_wrap.dart';
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

    return Scaffold(
        backgroundColor: const Color(0xFFe9e9f0),
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
                          slidersList: advertise(width: inst.width),
                          mainPadding: inst.mainPadding!,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        HotDeals(
                          mainPadding: inst.mainPadding!,
                          width: inst.width,
                          title: "Hot Deals",
                          aspectRatio: 0.7,
                          data: inst.itemData["hot-deal"],
                          targetTimeDayes: 2,
                          targetTimeHours: 22,
                          targetTimeMonth: 3,
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
                          id: 0,
                          productItem: 1,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        SpecialOffer(
                            width: inst.width!,
                            mainPadding: inst.mainPadding!,
                            data: inst.itemData["special-offer"]),
                        SizedBox(height: inst.verticalSpace),
                        WeeklyGift(
                            title: "Weekly Gift",
                            width: inst.width!,
                            slidersList: weeklyGift(width: inst.width!)),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 0.9,
                          aspectRatioNoMobile: 0.7,
                          height: inst.width! * 0.55,
                          itemList: solo.product[0].products,
                          mainPadding: inst.mainPadding!,
                          title: "Laptops",
                          width: inst.width!,
                          numberOfRows: 2,
                          id: 1,
                          productItem: 0,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        DealFestival(
                            width: inst.width!,
                            title: "Deal Festival",
                            padding: inst.mainPadding!,
                            data: inst.itemData["recomended"],
                            mainData: solo.dealFestival),
                        SizedBox(height: inst.verticalSpace),
                        MostLiked(
                          width: inst.width!,
                          mainPadding: inst.mainPadding!,
                          space: inst.width! / 51.4,
                          title: "Most Liked Items",
                          data: inst.itemData["liked"],
                          aspectRatio: 0.7,
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
                          id: 2,
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
                          id: 8,
                          numberOfRows: 2,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        TopBrand(
                            mainPadding: inst.mainPadding!,
                            spacing: inst.width! / 18,
                            runSpacing: inst.width! / 18,
                            width: inst.width!,
                            imagesList: solo.topBrandImage,
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
                          id: 3,
                          productItem: 2,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Gift(
                            title: "Get a Gift",
                            width: inst.width!,
                            productIndex: 4,
                            textBanner:
                                "Buy More Than 25.000 EGP and Get OFF 50% Dicount",
                            imageList: solo.imagesGiftDesign),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 1.1,
                          aspectRatioNoMobile: 0.8,
                          height: inst.width! * 0.50,
                          itemList: solo.product[4].products,
                          mainPadding: inst.mainPadding!,
                          title: "Cameras",
                          width: inst.width!,
                          id: 6,
                          numberOfRows: 2,
                          productItem: 4,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        LeftSideElement(
                          title: "Top Sale",
                          width: inst.width!,
                          itemCountForTablet: 2,
                          mainPadding: inst.mainPadding!,
                          itemCountForDesktop: 3,
                          space: 10,
                          data: inst.itemData["top-sale"],
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Close(width: inst.width!),
                        device == DeviceType.Tablet
                            ? const SizedBox(height: 120)
                            : device == DeviceType.Mobile
                                ? const SizedBox(height: 50)
                                : const SizedBox()
                      ],
                    ),
                  ),
                ),
                //  Head(width: inst.width, logoName: "Solo"),
                const BottomRow(),
                // const Important(),
                StartPages(height: inst.height!, width: inst.width)
              ],
            )));
  }
}
