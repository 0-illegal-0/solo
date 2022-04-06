import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidersPage extends GetxController {
  static late PageController move = PageController();
  double offset;
  static String text = "Text";
  static double? moveTo;
  static double? height;
  final int contentCount;
  final width;
  final int movementDurationPerMilliseconds;
  final int repetitionDurationPerSecond;
  Color? stage;
  static dynamic stageIcon;

  SlidersPage(
      {this.width,
      required this.offset,
      required this.movementDurationPerMilliseconds,
      required this.repetitionDurationPerSecond,
      required this.contentCount});

  @override
  void onInit() {
    execute();
  }

  List<Widget> initValue() {
    return List.generate(contentCount, (index) {
      return Container(
        color: index == (offset)
            ? const Color(0xFFc7143e)
            : const Color(0xFF999495),
        width: 15,
        height: 7,
      );
    });
  }

  bool direction = true;
  int pageOffset = 0;
  List<Widget> stages() {
    stageIcon = List.generate(contentCount, (index) {
      return Container(
        color: index == (move.page!.toInt())
            ? const Color(0xFFc7143e)
            : const Color(0xFF999495),
        width: 15,
        height: 7,
      );
    });
    return stageIcon;
  }

  sizes() {
    if (width >= 1100) {
      moveTo = 1100;
      height = 150;
    } else {
      moveTo = width - 30;
      height = 110;
    }
  }

  bool moveState = true;
  bool moveStateVal() {
    if (move.page!.toInt() == contentCount - 1) {
      moveState = false;
      return moveState;
    } else if (move.page!.toInt() == 0) {
      moveState = true;
      return moveState;
    }
    return moveState;
  }

  double moving() {
    moveStateVal();
    if (moveState == false && offset != 0.0 && moveState == false) {
      return previous();
    } else if (moveState == true && moveState == true) {
      return next();
    }
    return move.page!;
  }

  int? count;
  double previous() {
    count = move.page!.toInt() - 1;
    offset = count! * moveTo!;
    return offset;
  }

  double next() {
    count = move.page!.toInt() + 1;
    offset = count! * moveTo!;
    return offset;
  }

  moveSlide() {
    if (move.hasClients) {
      move.animateTo(moving(),
          duration: Duration(milliseconds: movementDurationPerMilliseconds),
          curve: Curves.easeIn);
    }
  }

  Future call() async {
    await Future.delayed(Duration(seconds: repetitionDurationPerSecond),
        () async {
      await moveSlide();
    });
    call();
    update();
  }

  Future stageListen2() async {
    await Future.delayed(const Duration(milliseconds: 50), () {
      stages();
    });
    stageListen2();
    update();
  }

  execute() {
    sizes();
    call();
    stageListen2();
  }
}
