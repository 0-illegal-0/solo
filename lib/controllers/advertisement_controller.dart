import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/advertisement_models.dart';

class Sliders extends GetxController {
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

  Sliders(
      {this.width,
      required this.offset,
      required this.movementDurationPerMilliseconds,
      required this.repetitionDurationPerSecond,
      required this.contentCount});

  onInit() {
    execute();
  }

  List<Widget> initValue() {
    return List.generate(advertisements.length, (index) {
      return Container(
        color: index == (offset) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
      );
    });
  }

  bool direction = true;
  int pageOffset = 0;
  List<Widget> stages() {
    stageIcon = List.generate(advertisements.length, (index) {
      return Container(
        color: index == (move.page!.toInt()) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
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
    if (move.page!.toInt() == contentCount) {
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
      // stages();
    });
    call();
    update();
  }

  Future stageListen() async {
    await Future.delayed(const Duration(milliseconds: 50), () {
      stages();
    });
    stageListen();
    update();
  }

  execute() {
    sizes();
    call();
    stageListen();
  }
}
