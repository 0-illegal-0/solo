import 'package:flutter/material.dart';

class Fotter extends StatelessWidget {
  Fotter({Key? key, this.width}) : super(key: key);
  final double? width;

  Widget socialMediaIcon(double? height, String? image) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Image.asset(
          image!,
          height: height,
        ));
  }

  List<String> stringFotterList = [
    "Careers",
    "Warranty Policy",
    "Sell with us",
    "Terms of Use",
    "Terms of Sale",
    "Privacy Policy"
  ];
  @override
  Widget build(BuildContext context) {
    return width! > 1000
        ? Column(
            children: [
              const Divider(thickness: 1, color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FotterItems(
                    rowWidth: 266,
                    iconHeight: 35,
                    item: socialMedia,
                    height: 30,
                    title: "Social Media",
                    titleWidth: 110,
                    maxWidthState: false,
                  ),
                  FotterItems(
                    rowWidth: 280,
                    iconHeight: 35,
                    item: application,
                    height: 40,
                    title: "Download application",
                    titleWidth: 165,
                    maxWidthState: false,
                  ),
                  FotterItems(
                    rowWidth: 350,
                    iconHeight: 35,
                    item: payment,
                    height: 40,
                    title: "Payment Gatways",
                    titleWidth: 165,
                    maxWidthState: true,
                  ),
                ],
              ),
              const SizedBox(height: 7),
              const Divider(thickness: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("© 2022 Solo. All rights reserved."),
                  SizedBox(
                    width: 600,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            stringFotterList.length,
                            (index) => TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0))),
                                  child: Text(
                                    stringFotterList[index],
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ))),
                  )
                ],
              ),
            ],
          )
        : width! > 649
            ? Column(
                children: [
                  const Divider(thickness: 1, color: Colors.black),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: width! -
                        0.5 -
                        (width! < 700 ? 600 : 670) -
                        (width! / 48) * 2,
                    children: [
                      FotterItems(
                        rowWidth: 266,
                        iconHeight: 35,
                        item: socialMedia,
                        height: 30,
                        title: "Social Media",
                        titleWidth: 110,
                        maxWidthState: false,
                      ),
                      width! < 700
                          ? FotterItems(
                              rowWidth: 280,
                              iconHeight: 35,
                              item: application,
                              height: 40,
                              title: "Download application",
                              titleWidth: 165,
                              maxWidthState: false,
                            )
                          : FotterItems(
                              rowWidth: 350,
                              iconHeight: 35,
                              item: payment,
                              height: 40,
                              title: "Payment Gatways",
                              titleWidth: 165,
                              maxWidthState: true,
                            ),
                      width! > 700
                          ? FotterItems(
                              rowWidth: 280,
                              iconHeight: 35,
                              item: application,
                              height: 40,
                              title: "Download application",
                              titleWidth: 165,
                              maxWidthState: false,
                            )
                          : FotterItems(
                              rowWidth: 350,
                              iconHeight: 35,
                              item: payment,
                              height: 40,
                              title: "Payment Gatways",
                              titleWidth: 165,
                              maxWidthState: true,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 600,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                stringFotterList.length,
                                (index) => TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(0))),
                                      child: Text(
                                        stringFotterList[index],
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ))),
                      ),
                      const SizedBox(height: 10),
                      const Text("© 2022 Solo. All rights reserved."),
                    ],
                  )
                ],
              )
            : const SizedBox();
  }
}

class FotterItems extends StatelessWidget {
  const FotterItems({
    Key? key,
    this.rowWidth,
    this.item,
    this.height,
    this.title,
    this.iconHeight,
    this.titleWidth,
    this.maxWidthState,
  }) : super(key: key);
  final double? rowWidth, height, titleWidth, iconHeight;
  final List? item;
  final String? title;
  final bool? maxWidthState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: rowWidth,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    item!.length,
                    (index) => Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0))),
                                  child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: iconHeight!,
                                          minHeight: iconHeight!,
                                          maxWidth: maxWidthState == true
                                              ? 70
                                              : double.infinity),
                                      child: Image.asset(item![index]))),
                            ],
                          ),
                        ))),
          ),
          Positioned(
            top: 11,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: titleWidth!,
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> socialMedia = [
  "assets/images/social-media-icon/twitter.png",
  "assets/images/social-media-icon/facebook.png",
  "assets/images/social-media-icon/Instagram.png",
  "assets/images/social-media-icon/youtube.png"
];

List<String> application = [
  "assets/images/app-store-icons/google-store.png",
  "assets/images/app-store-icons/apple-store.png",
];

List<String> payment = [
  "assets/images/payment-icons/master-card.png",
  "assets/images/payment-icons/paypal-logo.png",
  "assets/images/payment-icons/visa.png",
  "assets/images/payment-icons/skrill.png"
];
