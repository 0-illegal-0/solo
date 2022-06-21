import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/constants/constants.dart';
import 'package:solo/controllers/start_page.dart';

class StartPages extends StatelessWidget {
  const StartPages({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    StartPage controllers =
        Get.put(StartPage(width: width!, logo: "Solo"), permanent: false);
    controllers.start();
    return GetBuilder<StartPage>(
      builder: (controllers) => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: EdgeInsets.only(right: controllers.trick),
        width: width,
        height: height,
        color: const Color(0xFF06a7bf),
        alignment: Alignment.center,
        child: Text(
          controllers.logo!,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Lobster",
            fontSize: 60,
            color: Color.fromRGBO(255, 255, 255, controllers.opacity!),
          ),
        ),
      ),
    );
  }
}
