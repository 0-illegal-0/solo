import 'package:flutter/material.dart';
import 'package:solo/view/screens/home/components/advertisement/advertisement.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Head(),
                  Advertisement(
                    width: width,
                    title: "",
                  )
                ],
              ),
            )));
  }
}
