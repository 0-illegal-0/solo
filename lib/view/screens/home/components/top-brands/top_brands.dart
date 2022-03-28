import 'package:flutter/material.dart';
import 'package:solo/models/top_brand_models.dart';
import 'package:solo/view/screens/home/components/top-brands/brands_items.dart';

class TopBrand extends StatelessWidget {
  const TopBrand(
      {Key? key,
      this.width,
      this.countItem,
      this.title,
      this.spacing,
      this.mainPadding,
      this.runSpacing})
      : super(key: key);

  final width;
  final countItem;
  final title;
  final double? spacing;
  final mainPadding;
  final double? runSpacing;

  double get gridWidth {
    return (width - (mainPadding * 2) - (spacing! * (countItem! - 1))) /
        countItem!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.headline6),
              const TextButtonTheme(
                child: Text(
                  "See All",
                ),
                data: TextButtonThemeData(style: ButtonStyle()),
              )
            ],
          ),
        ),
        Wrap(
            spacing: spacing!,
            runSpacing: runSpacing!,
            children: List.generate(
                topBrands.length,
                (index) => BrandItems(
                      width: width,
                      gridWidth: gridWidth,
                      index: index,
                      image: topBrands[index].image,
                      title: "",
                    ))),
      ],
    );
  }
}
