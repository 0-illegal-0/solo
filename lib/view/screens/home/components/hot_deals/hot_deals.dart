import 'package:flutter/material.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deal_wrap.dart';
import 'package:solo/view/screens/home/components/hot_deals/rotate_head.dart';
import 'package:solo/view/screens/home/home_page.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({Key? key, this.width, this.mainPadding}) : super(key: key);
  final width;
  final mainPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RotateHead(),
        HotDealWrap(
          crossAxisCount: 3,
          width: width,
          mainPadding: mainPadding,
        )
      ],
    );
  }
}
