import 'package:flutter/material.dart';

class DeliveryHead extends StatelessWidget {
  const DeliveryHead({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: const Color(0xFFcedcde),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
            onPressed: () {},
            child: Row(
              children: const [
                Text(
                  "Delivery:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                ),
                Text(
                  " Cairo",
                  style: TextStyle(color: Color(0xFF000000)),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Color(0xFF000000),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
