import 'package:flutter/material.dart';
import 'package:solo/models/hot_deals_models.dart';

class HotDealsItems extends StatelessWidget {
  const HotDealsItems({Key? key, this.gridWidth, this.index}) : super(key: key);
  final gridWidth;
  final index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Tap");
      },
      child: Column(children: [
        Container(
          decoration:
              BoxDecoration(color: hotDealsItemsList[index].color, boxShadow: [
            BoxShadow(
                color: hotDealsItemsList[index].color,
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 7))
          ]),
          width: gridWidth,
          height: gridWidth * 1.2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            hotDealsItemsList[index].title!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        )
      ]),
    );
  }
}
