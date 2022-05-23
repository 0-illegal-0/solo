class Camera {
  Camera({this.image, this.desciption, this.price});
  final String? image, desciption, price;
}

List<Camera> cameras = [
  Camera(
    desciption: "HP Probook 445 G7 Laptop - AMD Ryzen 5 4500U - 8GB...",
    image: "assets/images/cameras/nikon.png",
    price: "10,150 EGP",
  ),
  Camera(
    desciption:
        "Canon EOS 800D EF-S 18-55mm F4-5.6 IS STM lens - 24.2 MP DSLR Camera Black...",
    image: "assets/images/cameras/canon-EOS-800D.png",
    price: "13,199 EGP",
  ),
  Camera(
    desciption: "Nikon COOLPIX P950 Digital Camera...",
    image: "assets/images/cameras/nikon-p950y.png",
    price: "12,399 EGP",
  ),
  Camera(
    desciption:
        "Nikon Coolpix B600 16 MP 60X Optical Zoom Full HD WIFI Digital Camera Black...",
    image: "assets/images/cameras/Nikon-Coolpix-B600.png",
    price: "5,699 EGP",
  ),
];
