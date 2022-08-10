import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(text: "So\n", style: TextStyle(color: Colors.grey)),
        TextSpan(text: "Li\n", style: TextStyle(color: Colors.blue)),
        TextSpan(text: "Man\n", style: TextStyle(color: Colors.yellow))
      ])),
    );
  }
}
