class Mobile {
  Mobile({this.image, this.desciption, this.price});
  final String? image;
  final String? desciption;
  final String? price;
}

List<Mobile> mobiles = [
  Mobile(
    desciption: "Samsung Galaxy A72, 6.5 inches 32GB/2GB Dual SIM 4G",
    image: "assets/images/mobiles/samsung_galaxy_a72.png",
    price: "10,999.00 EGP",
  ),
  Mobile(
    desciption: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
    image: "assets/images/mobiles/oppo2.png",
    price: "36,500.00 EGP",
  ),
];
