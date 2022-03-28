import 'package:flutter/material.dart';
import 'package:solo/models/hot_deals_models.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deal_items.dart';

class HotDealWrap extends StatelessWidget {
  const HotDealWrap(
      {Key? key,
      this.mainPadding,
      this.width,
      this.crossAxisCount,
      this.maxItemCount})
      : super(key: key);

  final double? mainPadding;
  final double? width;
  final int? crossAxisCount;
  final int? maxItemCount;
  double get gridWidth {
    return (width! - ((crossAxisCount! + 1) * mainPadding!)) / crossAxisCount!;
  }

  int itemCount() {
    if (hotDealsItemsList.length <= maxItemCount!) {
      return hotDealsItemsList.length;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Wrap(
          spacing: mainPadding!,
          runSpacing: mainPadding!,
          children: List.generate(
              itemCount(),
              (index) => HotDealsItems(
                    gridWidth: gridWidth,
                    index: index,
                  ))),
    );
  }
}
