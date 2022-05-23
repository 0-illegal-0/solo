import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

class ClientReview extends StatelessWidget {
  const ClientReview({
    Key? key,
    this.items,
    this.reviewIndex,
  }) : super(key: key);
  final List? items;
  final int? reviewIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(
          height: 30,
          color: Color(0xFF000000),
          indent: 00,
          thickness: 1,
        ),
        Image.asset("assets/images/avatar/avatar-placeholder.png", width: 40),
        Text(
          items![reviewIndex!]["user-name"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Icon(Icons.star_rate,
                    size: 19.0,
                    color: index > items![reviewIndex!]["rate"] - 1
                        ? Colors.grey
                        : Colors.orange))),
        SizedBox(height: device == DeviceType.Mobile ? 5 : 10),
        Text(
          items![reviewIndex!]["comment"],
          style: TextStyle(fontSize: device == DeviceType.Mobile ? 15 : 17),
        ),
        SizedBox(height: device == DeviceType.Mobile ? 5 : 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Verified Purchase",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  decoration: TextDecoration.underline),
            ),
            Text("1 month ago")
          ],
        ),
      ],
    );
  }
}
