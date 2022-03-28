import 'package:flutter/material.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deal_wrap.dart';
import 'package:solo/view/screens/home/components/hot_deals/rotate_head.dart';

class HotDeals extends StatelessWidget {
  const HotDeals(
      {Key? key,
      this.width,
      this.mainPadding,
      this.maxItemCount,
      this.title,
      this.crossAxisCount})
      : super(key: key);
  final double? width;
  final double? mainPadding;
  final int? maxItemCount, crossAxisCount;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotateHead(
          title: title!,
        ),
        HotDealWrap(
          crossAxisCount: crossAxisCount,
          width: width,
          mainPadding: mainPadding,
          maxItemCount: maxItemCount,
        )
      ],
    );
  }
}
