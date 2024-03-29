class Tablet {
  Tablet(
      {this.productBrands,
      this.warranty,
      this.informations,
      this.images,
      this.image,
      this.description,
      this.latestItem,
      this.title,
      this.price,
      this.reviews,
      this.discount,
      this.recomended,
      this.specialOffer,
      this.liked,
      this.hotDeal,
      this.topSale,
      this.oldPrice});
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

List<Tablet> tablets = [
  Tablet(
      description: "Lenovo M10 TB-X505X - 2GB RAM - 32GB - Black",
      image: "assets/images/tablet/Lenovo-M10-TB-X505X.png",
      title: "Lenovo M10",
      price: "4,500.00 EGP",
      specialOffer: false,
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Hawaii",
      images: [
        "assets/images/tablet/Lenovo-M10-TB-X505X.png",
        "assets/images/tablet/Lenovo-M10-TB-X505X.png",
        "assets/images/tablet/Lenovo-M10-TB-X505X.png",
      ],
      informations: {
        "highlights": {
          "Color": "Black",
          "Operating System": "Android",
          "Storage Capacity": " 32 GB",
          "Processor": "Qualcomm® Snapdragon™ 450, octa-core, 1.8 GHz",
          "Battery Capacity": "4850mAh battery capacity",
          "Display": "10.1 IPS FHD touchscreen",
          "Camera": "8MP rear camera, 5MP front camera",
          "RAM": "2 GB",
        },
        "specifications": {
          "GPU": "Adreno 506",
          "RAM": "2 GB",
          "Brand": "Lenovo",
          "Color": "Black",
          "Battery": "4.2, A2DP",
          "Chipset": "Qualcomm Snapdragon 429",
          "SIM card": "MicroSD-SIM",
          "Bluetooth": "4.2, A2DP",
          "I/O Ports":
              "Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot",
          "OS version": "Android 9.0 (Pie)",
          "Network 3G:": "HSDPA 900 / 1900 / 2100",
          "Display Size": "10.1 inches",
          "Display Type":
              "10.1 inches, 1280 x 800 pixels, IPS LCD capacitive touchscreen, 16M colors",
          "Product Type": "Tablet",
          "Primary Camera": "8 MP, AF",
          "CPU (Processor)": "Quad Core",
          "CPU Speed (GHz)": "Quad-core 2.0GHZ",
          "External Storage": "Up to 256 GB",
          "Internal Storage": "32 GB",
          "Operating System": "	Android",
          "Product Warranty": "Yes, with A-GPS",
          "Secondary Camera": "5 MP",
          "Video Resolutions": "1080p@30fps",
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
      liked: false,
      topSale: false),
  Tablet(
      description: "HUAWEI MatePad 10.4-inch 2022 Tablet",
      image: "assets/images/tablet/huawei-matepad-10.4.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "10,150.00 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/huawei-matepad-10.4.png",
        "assets/images/tablet/huawei-matepad-10.4.png",
        "assets/images/tablet/huawei-matepad-10.4.png"
      ],
      informations: {
        "highlights": {},
        "specifications": {},
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
      liked: false,
      topSale: false),
  Tablet(
      description: "Samsung Galaxy Tab A7 Lite",
      image: "assets/images/tablet/Samsung-Galaxy-Tab-A7-Lite.png",
      title: "Lenovo M10",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/Samsung-Galaxy-Tab-A7-Lite.png",
        "assets/images/tablet/Samsung-Galaxy-Tab-A7-Lite.png",
        "assets/images/tablet/Samsung-Galaxy-Tab-A7-Lite.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      recomended: false,
      latestItem: true,
      liked: true,
      hotDeal: true),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: true,
      topSale: true,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: true,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: true,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      discount: "20%",
      productBrands: "Hawaii",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/lenovo-tab-m7.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/Lenovo-M10-TB-X505X.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Tablet(
      description: "Lenovo Tab M7 Tablet",
      image: "assets/images/tablet/Lenovo-M10-TB-X505X.png",
      title: "Lenovo M10",
      specialOffer: false,
      price: "1.640 EGP",
      productBrands: "Hawaii",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      images: [
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
        "assets/images/tablet/lenovo-tab-m7.png",
      ],
      informations: {
        "highlights": {},
        "specifications": {},
      },
      reviews: [],
      warranty: "1 year",
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
];
