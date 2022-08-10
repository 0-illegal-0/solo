// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:solo/view/widget/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';

import '../../responsive.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  static const TextStyle contentStyle =
      TextStyle(color: Color(0xFF000000), fontSize: 14);

  static const TextStyle titleSyle = TextStyle(
      color: Color(0xFF000000), fontSize: 16, fontWeight: FontWeight.bold);

  static const String loremText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    right: width / 24,
                    left: width / 24,
                    top: device == DeviceType.Mobile
                        ? 115
                        : device == DeviceType.Tablet
                            ? 155
                            : 140),
                color: const Color(0xFFffffff),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Privacy Policy",
                          style:
                              TextStyle(color: Color(0xFF0eaae3), fontSize: 23),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text("ABOUT THIS POLICY", style: titleSyle),
                      const Text(loremText, style: contentStyle),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("HOW WE WILL USE YOUR PERSONAL INFORMATION?",
                          style: titleSyle),
                      const Text(loremText, style: contentStyle),
                      const SizedBox(height: 15),
                      const Text("HOW YOUR INFORMATION IS SHARED",
                          style: titleSyle),
                      const Text(loremText, style: contentStyle),
                      const SizedBox(height: 15),
                      const Text("HOW USE COOKIES"),
                      const Text(loremText, style: contentStyle),
                      const SizedBox(height: 15),
                      const Text(
                          "WHAT IS OUR PLAN TO PROTECT YOUR INFORMATION?",
                          style: titleSyle),
                      const Text(loremText, style: contentStyle),
                      const Text("YOUR LEGAL RIGHTS", style: titleSyle),
                      const Text(loremText, style: contentStyle),
                      const SizedBox(height: 15),
                      Fotter(width: width)
                    ],
                  ),
                )),
            Head(width: width),
            const BottomRow(),
          ],
        ),
      ),
    );
  }
}
