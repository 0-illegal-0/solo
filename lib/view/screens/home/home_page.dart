import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/home/components/advertisement/advertisement.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deals.dart';
import 'package:solo/view/screens/home/components/mobiles/mobiles.dart';
import 'package:solo/view/screens/home/components/special-offers/special_offer.dart';
import 'package:solo/view/screens/home/components/top-brands/top_brands.dart';
import 'package:solo/view/screens/home/components/top_categories/top_categories.dart';
import 'package:solo/view/widget/head/head.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double mainPadding = width / 24;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Head(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: mainPadding, left: mainPadding, top: 120),
                    child: Column(
                      children: [
                        Advertisement(
                          width: width,
                          title: "",
                        ),
                        const SizedBox(height: 20),
                        TopCategories(
                          width: width,
                          crossAxisCount: 4,
                          title: "Top Categories",
                          mainPadding: mainPadding,
                        ),
                        const SizedBox(height: 30),
                        HotDeals(
                          mainPadding: mainPadding,
                          width: width,
                          maxItemCount: 6,
                          title: "Hot Deals",
                          crossAxisCount: 3,
                        ),
                        const SizedBox(height: 30),
                        Mobiles(width: width),
                        const SizedBox(height: 30),
                        SpecialOffer(
                          width: width,
                          mainPadding: mainPadding,
                        ),
                        const SizedBox(height: 30),
                        TopBrand(
                          countItem: 4,
                          mainPadding: mainPadding,
                          spacing: width / 18,
                          runSpacing: width / 18,
                          width: width,
                          title: "Top Brands",
                        ),
                        const SizedBox(height: 30),
                        Drag()
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class Drag extends StatelessWidget {
  const Drag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        //width: 300,
        height: 300,
        color: Colors.green,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              //  width: double.infinity,
              //height: 300,
              color: Colors.amber,
            ),
            Container(
              //  width: double.infinity,
              height: 300,
              color: Colors.green,
            ),
            Container(
              //  width: double.infinity,
              height: 300,
              color: Colors.blue,
            ),
            Container(
              //  width: double.infinity,
              height: 300,
              color: Colors.black,
            )
          ],
          //cacheExtent: 10.0,
        ),
      ),
    );
  }
}

class WeeklyGift extends StatefulWidget {
  WeeklyGift({Key? key}) : super(key: key);

  @override
  State<WeeklyGift> createState() => _WeeklyGiftState();
}

class _WeeklyGiftState extends State<WeeklyGift> with TickerProviderStateMixin {
  late TabController execute;
  late TabController execute2; //= TabController(length: 5, vsync: this);
  int _selectedIndex = 0;
  get anime2 {
    Animation? anime =
        Tween(begin: 50.0, end: 200.0).animate(execute.animation!);
  }

  move() {
    execute.animateTo(1, duration: const Duration(seconds: 3));
  }

  void initState() {
    execute2 = TabController(length: 5, vsync: this, initialIndex: 0);
    execute = TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
    print("${execute.animation!.value}.............................");
    // execute = TabController(length: 5, vsync: this);
    execute.addListener(() {
      print("${execute.index}++++++");
    });
  }

  @override
  Widget build(BuildContext context) {
    TabBarAnimation controller = Get.put(TabBarAnimation());
    controller.execute(this);
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                execute.animateTo(2, duration: Duration(seconds: 3));
              },
              child: const Text("move")),
          Column(
            children: [
              GetBuilder<TabBarAnimation>(builder: (context) {
                return SizedBox(
                    height: controller.anime.value.toDouble(),
                    child: TabBarView(
                      controller: execute2,
                      children: [
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                        Container(
                          color: Colors.black,
                        ),
                        Container(
                          color: Colors.amber,
                        ),
                        Container(
                          color: Colors.red,
                        ),
                      ],
                    ));
              }),
              TabBar(
                  controller: execute,
                  isScrollable: true,
                  indicatorColor: Colors.blue,
                  //indicatorWeight: 1,
                  //indicatorPadding: EdgeInsets.all(5),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.yellow,
                  onTap: (index) {
                    print(index);
                  },
                  //indicatorSize: ,
                  tabs: const [
                    Tab(
                      child: Text(
                        'First',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Second',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Third',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Five',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Six',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarAnimation extends GetxController {
  AnimationController? animeController;
  dynamic anime;
  execute(This) {
    animeController =
        AnimationController(vsync: This, duration: Duration(seconds: 3));
    anime = Tween(begin: 50.0, end: 200.0).animate(animeController!)
      ..addStatusListener((status) {
        print(status);
      })
      ..addListener(() {
        print(anime!.value);
        update();
      });
    animeController!.forward();
    update();
  }
}
