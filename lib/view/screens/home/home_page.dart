import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solo/controllers/add_data.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/models/hot_deals_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/most_liked_items_models.dart';
import 'package:solo/models/recommended_models.dart';
import 'package:solo/models/speacial_offer.dart';
import 'package:solo/models/tablet_models.dart';
import 'package:solo/models/television_models.dart';
import 'package:solo/models/top_sale.dart';
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
import 'package:solo/view/widget/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/important.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import 'package:solo/view/widget/start_page.dart';
import 'package:solo/view/widget/view_item.dart';
import 'components/advertisement/advertisement.dart';
import 'components/camera/camera.dart';
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
    print("${solo.product[1].brands[0]["hello"]}-+++++++");
    return Scaffold(
        backgroundColor: Colors.white,
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
                        /*   Advertisement(
                          width: inst.width,
                          title: "",
                          mainPadding: inst.mainPadding!,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        HotDeals(
                          mainPadding: inst.mainPadding!,
                          width: inst.width,
                          title: "Hot Deals",
                          listhotDealsItemsList: listhotDealsItemsList,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        ViewItem(
                          aspectRatioMobile: 0.9,
                          height: inst.width! * 0.60,
                          itemList: solo.product[1].products,
                          mainPadding: inst.mainPadding!,
                          title: "Mobiles",
                          numberOfRows: 2,
                          aspectRatioNoMobile: 0.8,
                          width: inst.width!,
                          i: 0,
                        ),
                        SizedBox(height: inst.verticalSpace),*/
                        SpecialOffer(
                            width: inst.width!,
                            mainPadding: inst.mainPadding!,
                            specialOfferItemDatas: specialOfferItemDatas),
                          SizedBox(height: inst.verticalSpace),
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
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Recommended(
                            width: inst.width!,
                            title: "Recommended",
                            recomendedList: recomendedList),
                        SizedBox(height: inst.verticalSpace),
                        MostLiked(
                          width: inst.width!,
                          mainPadding: inst.mainPadding!,
                          space: inst.width! / 51.4,
                          title: "Most Liked Items",
                          mostLikedItems: mostLikedItems,
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
                        ),
                        SizedBox(height: inst.verticalSpace),
                        LatestItems(
                          width: inst.width!,
                          space: 5,
                          mainPadding: inst.mainPadding!,
                          title: "Latest Item",
                          aspectRatio: 1.1,
                          viewitemCount: 5,
                          height: inst.width! * 0.50,
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
                          numberOfRows: 1,
                          i: 3,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Gift(
                          title: "Get a Gift",
                          width: inst.width!,
                        ),
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
                        ),
                        SizedBox(height: inst.verticalSpace),
                        TopSale(
                          title: "Top Sale",
                          width: inst.width!,
                          itemCountForTablet: 2,
                          mainPadding: inst.mainPadding!,
                          itemCountForDesktop: 3,
                          space: 10,
                          topSale: topSale,
                        ),
                        SizedBox(height: inst.verticalSpace),
                        Fotter(width: inst.width!),
                        device == DeviceType.Tablet
                            ? const SizedBox(height: 120)
                            : const SizedBox()*/
                      ],
                    ),
                  ),
                ),
              /*  Head(width: inst.width),
                const BottomRow(),
                const Important()*/
                // StartPages(height: inst.height!, width: inst.width)
              ],
            )));
  }
}
