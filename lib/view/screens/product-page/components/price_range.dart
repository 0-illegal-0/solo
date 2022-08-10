import 'package:flutter/material.dart';
import 'package:solo/view/widget/note.dart';

class PriceRange extends StatelessWidget {
  PriceRange({Key? key, this.controller, this.width}) : super(key: key);
  final dynamic controller;
  final double? width;
  bool priceState = false;
  Widget priceFilterButton({String? title, dynamic priceFun}) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        onPressed: () {
          priceFun(); //();

          // controller.onFilter();
          //priceFun;
          controller.filterResult(
              filterTitle: "Price",
              filterValue: controller.priceFilterValues,
              checkVal: controller.priceButtonState);
        },
        child: Text(title!,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price (EGP)",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RangeField(controller: controller, feildId: 1, labelText: " 0"),
            RangeField(controller: controller, feildId: 2, labelText: " 0")
          ],
        ),
        const SizedBox(height: 7),
        Row(
          // mainAxisAlignment: controller.co,
          children: [
            priceFilterButton(title: "Filter", priceFun: controller.filter),
            controller.priceButtonState == true
                ? priceFilterButton(title: "Reset", priceFun: controller.reset)
                : const SizedBox(),
          ],
        ),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}

class RangeField extends StatelessWidget {
  const RangeField({Key? key, this.controller, this.labelText, this.feildId})
      : super(key: key);
  final dynamic controller;
  final String? labelText;
  final int? feildId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 80,
      child: TextFormField(
        maxLines: 1,
        onEditingComplete: () {
          controller.filter();
          print("onEditingComplete");
          controller.filterResult(
              filterTitle: "Price",
              filterValue: controller.priceFilterValues,
              checkVal: controller.priceButtonState);
        },
        textInputAction: TextInputAction.none,
        // initialValue: labelText!,
        decoration: InputDecoration(
          hintText: labelText!,
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          constraints: const BoxConstraints(maxHeight: 39),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 1),
          ),
          contentPadding: const EdgeInsets.only(bottom: 0),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 0),
          ),
        ),
        onChanged: (value) {
          controller.addValues(
              id: feildId, priceValue: double.parse(value).ceil());
        },
      ),
    );
  }
}

class SliderRange extends StatelessWidget {
  const SliderRange(
      {Key? key, this.controller, this.title, this.sliderValue, this.sliderId})
      : super(key: key);
  final dynamic controller;
  final String? title;
  final double? sliderValue;
  final int? sliderId;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFe1e8f2),
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: 55,
      width: 250,
      child: Stack(
        children: [
          Slider(
            value: sliderValue!,
            min: 0,
            max: 70000,
            onChanged: (val) {
              controller.friendValue(
                  v1: val.toDouble(), sliderId: sliderId, v2: val.toDouble());
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title!),
                  Text(
                    sliderValue!.toStringAsFixed(0).toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
