import 'package:flutter/material.dart';

class BrandItems extends StatelessWidget {
  const BrandItems(
      {Key? key,
      this.gridWidth,
      this.index,
      this.image,
      this.title,
      required this.width})
      : super(key: key);
  final double? gridWidth;
  final int? index;
  final double width;
  final String? image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFc2c2c2),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                      offset: Offset(0, 5))
                ]),
            width: gridWidth,
            height: gridWidth! / 1.68,
            child: Image.asset(
              image!,
            )),
      ]),
    );
  }
}
