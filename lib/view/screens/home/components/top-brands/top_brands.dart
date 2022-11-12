import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

import '../../../../style.dart';

class TopBrand extends StatelessWidget {
  TopBrand(
      {Key? key,
      this.width,
      this.title,
      this.spacing,
      this.mainPadding,
      this.runSpacing,
      this.imagesList})
      : super(key: key);

  final double? width;
  final String? title;
  final double? spacing;
  final double? mainPadding;
  final double? runSpacing;
  final List? imagesList;
  double? itemWidth;

  double get gridWidth {
    if (device! == DeviceType.Tablet) {
      return width! / 9.4;
    } else if (device! == DeviceType.Desktop) {
      return width! / 15.2;
    } else {
      return width! / 5.34;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(title!, style: titleStyle),
        ),
        Wrap(
            spacing: spacing!,
            runSpacing: spacing!,
            children: List.generate(
                imagesList!.length,
                (index) => InkWell(
                      onTap: () {},
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFFc2c2c2),
                                          blurRadius: 10,
                                          spreadRadius: 0.1,
                                          offset: Offset(0, 5))
                                    ]),
                                width: gridWidth,
                                height: gridWidth / 1.68,
                                child: Image.asset(imagesList![index])),
                          ]),
                    ))),
      ],
    );
  }
}
