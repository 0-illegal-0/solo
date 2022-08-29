import 'package:flutter/material.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';

import '../../responsive.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    right: width / 24,
                    left: width / 24,
                    top: device == DeviceType.Mobile
                        ? 115
                        : device == DeviceType.Tablet
                            ? 155
                            : 140),
                color: const Color(0xFFffffff),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Close(width: width)],
                  ),
                )),
            Head(width: width),
            const BottomRow(),
          ],
        ),
      ),
    );
  }
}
