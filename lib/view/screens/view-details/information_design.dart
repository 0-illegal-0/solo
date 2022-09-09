import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

class InformationDesign extends StatelessWidget {
  const InformationDesign({
    Key? key,
    required this.keys,
    required this.values,
    this.width,
    this.itemWidth,
    this.manualWidth,
  }) : super(key: key);

  final List<String> keys;
  final List values;
  final double? width, itemWidth;
  final bool? manualWidth;

  double get space {
    return width! / 28.8;
  }

  double get horizontalPadding {
    return (width! / 24) * 2;
  }

  double get itemWidth2 {
    return (width! - horizontalPadding - 8 * 2 - space) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: space,
      children: List.generate(
        keys.length,
        (index) => SizedBox(
          width: device == DeviceType.Mobile
              ? double.infinity
              : manualWidth == true
                  ? itemWidth2
                  : double.infinity,
          child: Column(
            children: [
              Container(
                color: const Color(0xFFe6e6fa),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        keys[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          values[index],
                          style: const TextStyle(
                            color: Color(0xFF737272),
                          ),
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}





/*

import 'package:flutter/material.dart';

class InformationDesign extends StatelessWidget {
  const InformationDesign({
    Key? key,
    required this.keys,
    required this.values,
  }) : super(key: key);

  final List<String> keys;
  final List values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        keys.length,
        (index) => Column(
          children: [
            Container(
              color: const Color(0xFFe6e6fa),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: Text(
                  keys[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    values[index],
                    style: const TextStyle(
                      color: Color(0xFF737272),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 7,
            )
          ],
        ),
      ),
    );
  }
}

*/