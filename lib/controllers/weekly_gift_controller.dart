import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidersPage extends GetxController {
  static late PageController move2;
  double offset;
  static String text = "Text";
  static double? height, moveTo;
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
    move2 = PageController();
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
  int trickt = 0;
  bool tricktBool = true;

  List<Widget> stages() {
    stageIcon = List.generate(contentCount, (index) {
      return Container(
        color: index == (move2.page!.toInt())
            ? const Color(0xFFc7143e)
            : const Color(0xFF999495),
        width: 15,
        height: 7,
      );
    });
    return stageIcon;
  }

  double get mainPadding {
    return width / 24;
  }

  sizes() {
    if (width >= 1100) {
      moveTo = width - (mainPadding * 2);

      height = 150;
    } else {
      moveTo = width - (mainPadding * 2);
      height = 110;
    }
  }

  bool moveState = true;
  bool moveStateVal() {
    if (move2.page!.toInt() == contentCount - 1) {
      moveState = false;
      return moveState;
    } else if (move2.page!.toInt() == 0) {
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
    return move2.page!;
  }

  int? count;
  double previous() {
    count = move2.page!.toInt() - 1;
    offset = count! * moveTo!;
    return offset;
  }

  double next() {
    count = move2.page!.toInt() + 1;
    offset = count! * moveTo!;
    return offset;
  }

  moveSlide() {
    if (move2.hasClients) {
      move2.animateTo(moving(),
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

  execute() async {
    await sizes();
    await call();
    stageListen2();
  }
}
