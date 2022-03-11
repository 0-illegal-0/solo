import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({Key? key, this.width, this.title}) : super(key: key);

  final width;
  final title;
  @override
  Widget build(BuildContext context) {
    Sliders controller = Get.put(Sliders(
        width: width,
        offset: 0,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: advertisements.length - 1));
    //controller.execute();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF8a9296),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0))
              ],
            ),
            width: Sliders.moveTo!,
            constraints: const BoxConstraints(
                maxWidth: 1100, maxHeight: 150, minHeight: 110),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: Sliders.move,
                itemCount: advertisements.length,
                itemBuilder: (context, i) {
                  return AdvertisementContent(
                    i: i,
                  );
                })),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 180,
          child: GetBuilder<Sliders>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  Sliders.foo == null ? controller.initValue() : Sliders.foo,
            );
          }),
        )
      ],
    );
  }
}

class Sliders extends GetxController {
  static late ScrollController move = ScrollController();
  double offset;
  static String text = "Text";
  static double? moveTo;
  double? max;
  static double? height;
  final int contentCount;
  final width;
  final int movementDurationPerMilliseconds;
  final int repetitionDurationPerSecond;
  Color? stage;
  static dynamic foo;

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
      print(offset);
      return Container(
        color: index == (offset / moveTo!) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
      );
    });
  }

  List<Widget> stages() {
    foo = List.generate(advertisements.length, (index) {
      return Container(
        color: index == (offset / moveTo!) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
      );
    });
    return foo;
  }

  sizes() {
    if (width >= 1100) {
      moveTo = 1100;
      height = 150;
    } else {
      moveTo = width;
      moveTo = moveTo! - 20;
      height = 110;
      max = moveTo! * contentCount;
    }
  }

  double moving() {
    if (offset == max && offset != 0) {
      max = max! - moveTo!;
      return previous();
    } else {
      max = moveTo! * contentCount;
    }
    return next();
  }

  double previous() {
    offset = offset - moveTo!;
    return offset;
  }

  double next() {
    offset = offset + moveTo!;
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
    await Future.delayed(Duration(seconds: repetitionDurationPerSecond), () {
      moveSlide();
      stages();
    });
    call();
    update();
  }

  execute() {
    sizes();
    call();
  }
}

class AdvertisementModels {
  final String? description, name, job, image;
  const AdvertisementModels(
      {this.description, this.name, this.job, this.image});
}

List<AdvertisementModels> advertisements = [
  const AdvertisementModels(
      name: "name",
      job: "job-title",
      description:
          '1Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '2Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '3Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '4Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png')
];

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
