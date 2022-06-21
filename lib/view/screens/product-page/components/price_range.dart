import 'package:flutter/material.dart';
import 'package:solo/view/widget/note.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({Key? key, this.controller, this.width}) : super(key: key);
  final dynamic controller;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
        SliderRange(
            title: "Min: ",
            sliderId: 1,
            controller: controller,
            sliderValue: controller.inia.toDouble()),
        const SizedBox(height: 3),
        SliderRange(
          title: "Max: ",
          controller: controller,
          sliderId: 2,
          sliderValue: controller.inia2.toDouble(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RangeField(controller: controller),
            RangeField(controller: controller)
          ],
        ),
        Center(
          child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
              onPressed: () {
                note(context);
              },
              child: const Text("Done")),
        ),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}

class RangeField extends StatelessWidget {
  const RangeField({Key? key, this.controller}) : super(key: key);
  final dynamic controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 80,
      child: TextFormField(
        decoration: const InputDecoration(
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          constraints: BoxConstraints(maxHeight: 39),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 1),
          ),
          contentPadding: EdgeInsets.only(bottom: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(color: Color(0xFF000000), width: 0),
          ),
        ),
        onChanged: (value) {},
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
            max: 100,
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
