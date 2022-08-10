class Television {
  Television({
    this.warranty,
    this.discount,
    this.oldPrice,
    this.recomended,
    this.productBrands,
    this.images,
    this.reviews,
    this.informations,
    this.specialOffer,
    this.image,
    this.latestItem,
    this.description,
    this.price,
    this.topSale,
    this.hotDeal,
    this.title,
    this.liked,
  });
  final String? image,
      title,
      description,
      price,
      warranty,
      discount,
      oldPrice,
      productBrands;
  final List? images, reviews;
  final Map? informations;
  final bool? specialOffer, recomended, latestItem, liked, topSale, hotDeal;
}

List<Television> televisions = [
  Television(
      description: "Samsung 75 Inches 4K Ultra HD LED Smart TV...",
      title: "Samsung 75",
      specialOffer: false,
      image: "assets/images/tv/samsung-75-inches.png",
      price: "26,150.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Hawaii",
      images: [
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
      ],
      informations: {
        "highlights": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
        "specifications": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
      },
      reviews: [
        {
          "user-name": "Ahmed Ali",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ehab El-Masry",
          "rate": 3,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        }
      ],
      warranty: "1 year",
      recomended: false,
      latestItem: false,
      liked: true,
      topSale: true,
      hotDeal: false),
  Television(
      description: "LG 65 inches UHD 4K Smart TV, Active HDR, WebOS...",
      image: "assets/images/tv/led-lg-1.jpg",
      specialOffer: false,
      title: "Asus FX506HEB-B ...",
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Hawaii",
      images: [
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
      ],
      informations: {
        "highlights": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
        "specifications": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
      },
      reviews: [
        {
          "user-name": "Ahmed Ali",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ehab El-Masry",
          "rate": 3,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        }
      ],
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Television(
      description: "Sharp 55 inch 4K Ultra HD LED Smart Android TV with...",
      image: "assets/images/tv/led-lg-1.jpg",
      title: "Samsung 75",
      specialOffer: true,
      price: "9,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Hawaii",
      images: [
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
        "assets/images/tv/samsung-75-inches.png",
      ],
      informations: {
        "highlights": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
        "specifications": {
          "Resolution ": "3840 x 2160",
          "Display Resolution": "4K UHD",
          "Color": " Black",
          "Screen sizes": "50",
          "Display type	": " Led",
          "Connectivity ": "Wifi or Ethernet",
          "Release year	": "2021",
          "USB": "1 USB port",
          "Ethernet": "1 Ethernet port"
        },
      },
      reviews: [
        {
          "user-name": "Ahmed Ali",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ehab El-Masry",
          "rate": 3,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        },
        {
          "user-name": "Ibrahim Youssef",
          "rate": 4,
          "comment":
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                  "There is no one who loves pain itself."
        }
      ],
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: true),
];
