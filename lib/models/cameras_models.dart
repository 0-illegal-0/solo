class Camera {
  Camera({
    this.warranty,
    this.discount,
    this.recomended,
    this.oldPrice,
    this.images,
    this.reviews,
    this.specialOffer,
    this.title,
    this.productBrands,
    this.informations,
    this.image,
    this.description,
    this.latestItem,
    this.liked,
    this.topSale,
    this.price,
  });
  final String? image,
      description,
      title,
      price,
      warranty,
      discount,
      oldPrice,
      productBrands;
  final List? images, reviews;
  final Map? informations;
  final bool? specialOffer, recomended, latestItem, liked, topSale;
}

List<Camera> cameras = [
  Camera(
      description:
          "Canon EOS R5 Full-Frame Mirrorless Camera w/ RF24-105mm F4 L is USM Lens Kit...",
      image: "assets/images/cameras/nikon.png",
      specialOffer: false,
      title: "Canon EOS R5",
      price: "10,150 EGP",
      productBrands: "Canon",
      discount: "15",
      images: [
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png"
      ],
      informations: {
        "highlights": {
          "Display": "10.1 IPS FHD touchscreen",
          "Camera": "25MP",
          "Color": "Black",
          "RAM": "2 GB",
          "Continuous Shooting Speed": "12 fps"
        },
        "specifications": {
          "Product Dimensions": "11.1 x 8.9 x 7.4 inches",
          "RAM": "2 GB",
          "Item Weight": "3.08 pounds",
          "Color": "Black",
          "Date First Available	": "July 9, 2020",
          "Manufacturer": "Canon USA",
        },
      },
      oldPrice: "0000000",
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
      warranty: "3 years",
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: false),
  Camera(
      description:
          "Canon EOS 800D EF-S 18-55mm F4-5.6 IS STM lens - 24.2 MP DSLR Camera Black...",
      image: "assets/images/cameras/canon-EOS-800D.png",
      title: "Canon EOS R5",
      price: "13,199 EGP",
      specialOffer: true,
      productBrands: "Sony",
      discount: "15",
      images: [
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png"
      ],
      informations: {
        "highlights": {
          "Display": "10.1 IPS FHD touchscreen",
          "Camera": "25MP",
          "Color": "Black",
          "RAM": "2 GB",
          "Continuous Shooting Speed": "12 fps"
        },
        "specifications": {
          "Product Dimensions": "11.1 x 8.9 x 7.4 inches",
          "RAM": "2 GB",
          "Item Weight": "3.08 pounds",
          "Color": "Black",
          "Date First Available	": "July 9, 2020",
          "Manufacturer": "Canon USA",
        },
      },
      oldPrice: "0000000",
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
      warranty: "3 years",
      recomended: false,
      latestItem: false,
      liked: true,
      topSale: false),
  Camera(
      description: "Nikon COOLPIX P950 Digital Camera...",
      image: "assets/images/cameras/Sigma Alpha.jpg",
      title: "Sony Alpha 7 IV",
      price: "12,399 EGP",
      specialOffer: true,
      productBrands: "Canon",
      discount: "15",
      images: [
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png"
      ],
      informations: {
        "highlights": {
          "Display": "10.1 IPS FHD touchscreen",
          "Camera": "25MP",
          "Color": "Black",
          "RAM": "2 GB",
          "Continuous Shooting Speed": "12 fps"
        },
        "specifications": {
          "Product Dimensions": "11.1 x 8.9 x 7.4 inches",
          "RAM": "2 GB",
          "Item Weight": "3.08 pounds",
          "Color": "Black",
          "Date First Available	": "July 9, 2020",
          "Manufacturer": "Canon USA",
        },
      },
      oldPrice: "0000000",
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
      warranty: "3 years",
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: true),
  Camera(
      description:
          "Nikon Coolpix B600 16 MP 60X Optical Zoom Full HD WIFI Digital Camera Black...",
      image: "assets/images/cameras/nikon.jpg",
      title: "Sigma Alpha",
      specialOffer: false,
      price: "5,699 EGP",
      productBrands: "Canon",
      discount: "15",
      images: [
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png",
        "assets/images/cameras/nikon.png"
      ],
      informations: {
        "highlights": {
          "Display": "10.1 IPS FHD touchscreen",
          "Camera": "25MP",
          "Color": "Black",
          "RAM": "2 GB",
          "Continuous Shooting Speed": "12 fps"
        },
        "specifications": {
          "Product Dimensions": "11.1 x 8.9 x 7.4 inches",
          "RAM": "2 GB",
          "Item Weight": "3.08 pounds",
          "Color": "Black",
          "Date First Available	": "July 9, 2020",
          "Manufacturer": "Canon USA",
        },
      },
      oldPrice: "0000000",
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
      warranty: "3 years",
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false),
];
