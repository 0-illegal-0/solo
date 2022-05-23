import 'package:flutter/material.dart';
import 'package:solo/models/hot_deals_models.dart';
import 'package:solo/view/responsive.dart';

class HotDealWrap extends StatelessWidget {
  const HotDealWrap({
    Key? key,
    this.mainPadding,
    this.width,
    // this.crossAxisCount,
  }) : super(key: key);

  final double? mainPadding;
  final double? width;
  //final int? crossAxisCount;
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

  // final int? maxItemCount;
  double get gridWidth {
    return ((width! - ((crossAxisCount + 1) * mainPadding!)) / crossAxisCount) -
        0.3;
  }

  int itemCount() {
    if (hotDealsItemsList.length <= maxItemCount) {
      return hotDealsItemsList.length;
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
                    print("Tap");
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
                        child: Image.asset(hotDealsItemsList[index].image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: gridWidth,
                        child: Text(
                          hotDealsItemsList[index].title!,
                          //softWrap: false,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    )
                  ])))),
    );
  }
}
