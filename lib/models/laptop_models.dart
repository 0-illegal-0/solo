class Laptop {
  Laptop({this.image, this.desciption, this.price});
  final String? image;
  final String? desciption;
  final String? price;
}

List<Laptop> laptops = [
  Laptop(
    desciption: "HP Probook 445 G7 Laptop - AMD Ryzen 5 4500U - 8GB...",
    image: "assets/images/laptops/hp-probook-445.png",
    price: "10,150.00 EGP",
  ),
  Laptop(
    desciption: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
    image: "assets/images/laptops/dell-g15.jpg",
    price: "36,500.00 EGP",
  ),
];
