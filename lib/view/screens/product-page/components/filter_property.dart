import 'package:flutter/material.dart';

class FilterProperty extends StatelessWidget {
  FilterProperty({
    Key? key,
    this.itemProperty,
    this.controller,
    this.title,
    this.id,
    this.width,
  }) : super(key: key);
  final List? itemProperty;
  final String? title;
  final dynamic controller;
  final int? id;
  final width;
  int bar = 5;
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
        Text(title!, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(itemProperty!.length, (index) {
              title == "Rating" ? bar = bar - 1 : bar = 0;
              return Row(
                children: [
                  SizedBox(
                    height: 20,
                    child: Checkbox(
                      value: controller.values![index + id!],
                      onChanged: (val) {
                        controller.checkStateChange(
                            index2: index,
                            listItems: controller.values,
                            id: id);
                        controller.filterResult(
                            filterTitle: title,
                            filterValue: itemProperty![index]["value"],
                            checkVal: val);
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
                                listItems: controller.values,
                                id: id);
                            controller.filterResult(
                                filterTitle: title,
                                filterValue: itemProperty![index]["value"],
                                checkVal: controller.values![index + id!]);
                          },
                          child: title == "Rating"
                              ? Row(
                                  children: List.generate(5, (index) {
                                  return Icon(Icons.star_rate,
                                      size: 20.0,
                                      color: index > bar
                                          ? Colors.grey
                                          : const Color(0xFFfc8c03));
                                }))
                              : Text(
                                  itemProperty![index]['text'],
                                  style: const TextStyle(color: Colors.black),
                                ))),
                  title == "Color"
                      ? Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: itemsColor[index]["color"],
                              border: Border.all(
                                  color: index == 1
                                      ? Colors.grey
                                      : itemsColor[index]["color"],
                                  width: 0.5)),
                          child: TextButton(
                            child: const SizedBox(),
                            onPressed: () {
                              controller.checkStateChange(
                                  index2: index,
                                  listItems: controller.values,
                                  id: id);
                              controller.filterResult(
                                  filterTitle: title,
                                  filterValue: itemProperty![index]["value"],
                                  checkVal: controller.values![index + id!]);
                            },
                          ))
                      : const SizedBox()
                ],
              );
            })),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
