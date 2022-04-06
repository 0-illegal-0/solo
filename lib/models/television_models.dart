class Television {
  Television({
    this.image,
    this.desciption,
    this.price,
    this.fullDesciption,
  });
  final String? image, desciption, fullDesciption, price;
}

List<Television> televisions = [
  Television(
    desciption: "Samsung 75 Inches 4K Ultra HD LED Smart TV...",
    fullDesciption:
        "Samsung 75 Inches 4K Ultra HD LED Smart TV with Built-in Receiver, Black - UA75AU8000UXEG",
    image: "assets/images/tv/samsung-75-inches.png",
    price: "26,150.00 EGP",
  ),
  Television(
    desciption: "LG 65 inches UHD 4K Smart TV, Active HDR, WebOS...",
    image: "assets/images/tv/lg-lg-nano-cel.png",
    fullDesciption:
        "LG 65 inches UHD 4K Smart TV, Active HDR, WebOS Operating System, ThinQ AI - 65UP7550PVG",
    price: "36,500.00 EGP",
  ),
  Television(
    desciption: "Sharp 55 inch 4K Ultra HD LED Smart Android TV with...",
    image: "assets/images/tv/Sharp-55-inch-4K.png",
    fullDesciption:
        "Sharp 55 inch 4K Ultra HD LED Smart Android TV with Remote Control and Built-in Receiver - 4T-C55DL6EX",
    price: "9,500.00 EGP",
  ),
];
