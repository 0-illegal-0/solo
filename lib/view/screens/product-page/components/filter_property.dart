import 'package:flutter/material.dart';

class FilterProperty extends StatelessWidget {
  const FilterProperty({
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
                          },
                          child: Text(
                            itemProperty![index],
                            style: const TextStyle(color: Colors.black),
                          ))),
                ],
              );
            })),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
