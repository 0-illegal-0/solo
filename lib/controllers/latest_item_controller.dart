import 'package:get/get.dart';

class MoveSliderMain extends GetxController {
  MoveSliderMain(
      {this.crossAxisCount, this.numberOfRows, this.itemsList, this.width});
  List<int> moveCount = [];

  createMoveCountList() {
    for (var i = 0; i < 21; i++) {
      if (i <= 10) {
        moveCount.add(0);
      } else {
        moveUnit.add(0);
      }
    }
  }

  List<double> moveUnit = [];
  final int? crossAxisCount, numberOfRows;
  double? width;
  List? itemsList;

  moveNext({int? id, int? wrapCount}) {
    if (moveCount[id!] < wrapCount! - 1) {
      print(
          "+++++++++++++++  ${moveCount[id]} ++++++++++++++ ${wrapCount - 1}");
      moveUnit[id] = moveUnit[id] - width!;
      moveCount[id] = moveCount[id] + 1;
    }
    update();
  }

  moveBack({int? id, int? wrapCount}) {
    if (moveCount[id!] > 0) {
      moveUnit[id] = moveUnit[id] + width!;
      moveCount[id] = moveCount[id] - 1;
    }
    update();
  }

  @override
  void onInit() {
    createMoveCountList();
    super.onInit();
  }
}
