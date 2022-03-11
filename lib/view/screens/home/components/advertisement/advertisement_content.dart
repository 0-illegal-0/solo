import 'package:flutter/material.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import 'package:solo/models/advertisement_models.dart';

class AdvertisementContent extends StatelessWidget {
  const AdvertisementContent({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sliders.moveTo!,
      constraints: BoxConstraints(
        maxWidth: Sliders.moveTo!,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          color: const Color(0xFF16debd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                advertisements[i].image!,
                width: Sliders.height,
                height: Sliders.height,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advertisements[i].description!,
                      ),
                      Text(
                        '${advertisements[i].name},  ${advertisements[i].job}  ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
