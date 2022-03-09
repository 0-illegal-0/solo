import 'package:flutter/material.dart';
import 'package:solo/view/widget/head/components/curve_painter.dart';
import 'package:solo/view/widget/head/components/search_app.dart';

class Head extends StatelessWidget {
  Head({
    Key? key,
  }) : super(key: key);

  double logoWidth = 120;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: CustomPaint(
            painter: CurvePainter(),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchApp(),
                        useRootNavigator: true);
                  },
                  icon: Icon(Icons.search_outlined)),
            ),
            Container(
                margin: EdgeInsets.only(left: 0, right: 10),
                child: IconButton(
                  onPressed: () {
                    bottomSheet(context);
                  },
                  icon: Icon(Icons.more_horiz_outlined),
                )),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.50 - logoWidth / 2, top: 3),
        child: Container(
          width: logoWidth,
          height: 60,
          alignment: Alignment.center,
          //color: Colors.white,
          child: Text(
            "Solo",
            style: TextStyle(
                fontFamily: "Lobster", fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    ]);
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 100,
              color: Colors.white,
              child: Text("empety"),
            ));
  }
}
