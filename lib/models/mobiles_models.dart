class Mobile {
  Mobile(
      {this.image,
      this.description,
      this.price,
      this.title,
      this.reviews,
      this.productBrands,
      this.images,
      this.discount,
      this.oldPrice,
      this.latestItem,
      this.specialOffer,
      this.recomended,
      this.warranty,
      this.liked,
      this.hotDeal,
      this.topSale,
      this.informations});

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

List<Mobile> mobiles = [
  Mobile(
      description: "Samsung Galaxy A72, 6.5 inches 32GB/2GB Dual SIM 4G",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      specialOffer: false,
      price: "10,999.00 EGP",
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      warranty: '2 years',
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: true),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      warranty: "2 years",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      productBrands: "Samsung",
      specialOffer: false,
      warranty: "1 Years",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/iphone-11.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      productBrands: "Samsung",
      specialOffer: false,
      images: [
        "assets/images/mobiles/iphone-11.png",
        "assets/images/mobiles/iphone-11.png",
        "assets/images/mobiles/iphone-11.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: true,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/iphone-11.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/iphone-11.png",
        "assets/images/mobiles/iphone-11.png",
        "assets/images/mobiles/iphone-11.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/reno-6-black.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/reno-6-black.png",
        "assets/images/mobiles/reno-6-black.png",
        "assets/images/mobiles/reno-6-black.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: true,
      liked: true,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/reno-6-black.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/reno-6-black.png",
        "assets/images/mobiles/reno-6-black.png",
        "assets/images/mobiles/reno-6-black.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: true),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      specialOffer: false,
      price: "36,500.00 EGP",
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  /*Mobile(
      description:
          "Samsung Galaxy A72 Dual SIM - 6.7 Inches, 8 GB RAM, 128 GB - Violet",
      image: "assets/images/mobiles/samsung_galaxy_a72.png",
      title: "Samsung Galaxy A72",
      price: "36,500.00 EGP",
      specialOffer: false,
      productBrands: "Samsung",
      images: [
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
        "assets/images/mobiles/samsung_galaxy_a72.png",
      ],
      discount: "20%",
      oldPrice: "3,500.00 EGP",
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
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: true,
      hotDeal: false),*/
];
