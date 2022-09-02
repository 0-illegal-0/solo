import 'package:get/get.dart';

class MoveSlider extends GetxController {
  MoveSlider({this.itemsList, this.width});
  double moveUnit = 0;
  int moveCount = 0;
  double? width;
  List? itemsList;
  int get wrapCount {
    return (itemsList!.length / (5)).ceil();
  }

  moveNext() {
    if (moveCount < wrapCount - 1) {
      moveUnit = moveUnit - width!;
      moveCount = moveCount + 1;
    }
    update();
  }

  moveBack() {
    if (moveCount > 0) {
      moveUnit = moveUnit + width!;
      moveCount = moveCount - 1;
    }
    update();
  }
}

class MoveSliderMain extends GetxController {
  MoveSliderMain(
      {this.crossAxisCount, this.numberOfRows, this.itemsList, this.width});
  List<int> moveCount = [];

createMoveCountList(){
  for (var i = 0; i < 21; i++) {
    if (i <= 10){
      moveCount.add(0);
    }else{
      moveUnit.add(0);
    }
  }
}
  List<double> moveUnit = [];
  final int? crossAxisCount, numberOfRows;
  double? width;
  List? itemsList;

  moveNext({int? i, int? wrapCount}) {
    if (moveCount[i!] < wrapCount! - 1) {
      moveUnit[i] = moveUnit[i] - width!;
      moveCount[i] = moveCount[i] + 1;
    }
    print("wrapCount:- $wrapCount");
    update();
  }

  moveBack({int? i, int? wrapCount}) {
    if (moveCount[i!] > 0) {
      moveUnit[i] = moveUnit[i] + width!;
      moveCount[i] = moveCount[i] - 1;
    }
    update();
  }

  @override
  void onInit() {
    createMoveCountList();
    super.onInit();
  }
}
