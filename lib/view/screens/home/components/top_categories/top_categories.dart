import 'package:flutter/material.dart';
import 'package:solo/constants/constants.dart';
import 'package:solo/models/top_categories_models.dart';

class TopCategories extends StatelessWidget {
  const TopCategories(
      {Key? key, this.width, this.crossAxisCount, this.title, this.mainPadding})
      : super(key: key);
  final width;
  final crossAxisCount;
  final title;
  final mainPadding;
  double get gridWidth {
    return (width - ((crossAxisCount + 1) * mainPadding)) / crossAxisCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline6),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                ))
          ],
        ),
        Wrap(
            spacing: mainPadding,
            runSpacing: mainPadding,
            children: List.generate(
                topCategories.length,
                (index) => TopCategoriesItems(
                      gridWidth: gridWidth,
                      index: index,
                    ))),
      ],
    );
  }
}

class TopCategoriesItems extends StatelessWidget {
  const TopCategoriesItems({Key? key, this.gridWidth, this.index})
      : super(key: key);
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
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFF8a9296),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 7))
            ]),
            width: gridWidth,
            height: gridWidth,
            child: Image.asset(topCategories[index].image!)),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            topCategories[index].title!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        )
      ]),
    );
  }
}
