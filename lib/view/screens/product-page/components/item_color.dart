import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({Key? key, this.controller, this.width}) : super(key: key);
  final double? width;
  final dynamic controller;
  static const List itemsColor = [
    {"color-name": "Black", "color": Colors.black},
    {"color-name": "White", "color": Colors.white},
    {"color-name": "Red", "color": Colors.red},
    {"color-name": "Blue", "color": Colors.blue}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(itemsColor.length, (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Checkbox(
                          value: controller.itemsColor[index],
                          onChanged: (val) {
                            controller.checkStateChange(
                              index2: index,
                              id: 0,
                              listItems: controller.itemsColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                          height: 35,
                          child: TextButton(
                              onPressed: () {
                                controller.checkStateChange(
                                    index2: index,
                                    id: 0,
                                    listItems: controller.itemsColor);
                              },
                              child: Text(itemsColor[index]["color-name"]))),
                      const SizedBox(width: 5),
                      TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0))),
                          onPressed: () {
                            controller.checkStateChange(
                                index2: index,
                                id: 0,
                                listItems: controller.itemsColor);
                          },
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: itemsColor[index]["color"],
                                border: Border.all(
                                    color: index == 1
                                        ? Colors.grey
                                        : itemsColor[index]["color"],
                                    width: 0.5)),
                          ))
                    ],
                  );
                })),
          ],
        ),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
