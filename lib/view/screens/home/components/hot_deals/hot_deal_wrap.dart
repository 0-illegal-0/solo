import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/hot_deals_models.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

class HotDealWrap extends StatelessWidget {
  const HotDealWrap({
    Key? key,
    this.mainPadding,
    this.width,
  }) : super(key: key);

  final double? mainPadding;
  final double? width;
  int get maxItemCount {
    return crossAxisCount * 2;
  }

  int get crossAxisCount {
    if (device == DeviceType.Mobile) {
      return 3;
    } else if (device == DeviceType.Tablet) {
      return 5;
    } else {
      return 7;
    }
  }

  double get gridWidth {
    return ((width! - ((crossAxisCount + 1) * mainPadding!)) / crossAxisCount) -
        0.4;
  }

  int itemCount() {
    if (listhotDealsItemsList.length <= maxItemCount) {
      return listhotDealsItemsList.length;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
          spacing: mainPadding!,
          runSpacing: mainPadding!,
          children: List.generate(
              itemCount(),
              (index) => InkWell(
                  onTap: () {
                    Get.to(
                        () => ViewDetails(
                              width: width!,
                              aspectRatio: listhotDealsItemsList[index]
                                  ["aspectRatio"],
                              height: width! *
                                  listhotDealsItemsList[index]["height"],
                              itemList: listhotDealsItemsList[index]
                                  ["item-list"],
                              index: index,
                              numberOfRows: 1,
                              title: "Customer  Viewed",
                            ),
                        preventDuplicates: false);
                    Get.deleteAll();
                  },
                  child: Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFb1b3b5),
                                blurRadius: 10,
                                spreadRadius: 0.1,
                                offset: Offset(0, 0))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: gridWidth,
                      height: gridWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                            listhotDealsItemsList[index]["item"].image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: gridWidth,
                        child: Text(
                          listhotDealsItemsList[index]["item"].title!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    )
                  ])))),
    );
  }
}
