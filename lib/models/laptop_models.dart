class Laptop {
  Laptop(
      {this.warranty,
      this.discount,
      this.oldPrice,
      this.images,
      this.topSale,
      this.reviews,
      this.productBrands,
      this.informations,
      this.image,
      this.recomended,
      this.specialOffer,
      this.title,
      this.hotDeal,
      this.latestItem,
      this.description,
      this.liked,
      this.price});
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

List<Laptop> laptops = [
  Laptop(
      description: "HP Probook 445 G7 Laptop - AMD Ryzen 5 4500U - 8GB...",
      image: "assets/images/laptops/hp-probook-445.png",
      title: "HP Probook 445",
      specialOffer: false,
      price: "10,150.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
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
              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...There is no one who loves pain itself."
        }
      ],
      warranty: "1 year",
      recomended: false,
      latestItem: false,
      liked: false,
      topSale: false,
      hotDeal: false),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/hp-probook-445.png",
      specialOffer: false,
      title: "HP Probook 445",
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
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
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: true),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/dell-g15.jpg",
      title: "HP Probook 445",
      specialOffer: false,
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
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
      latestItem: true,
      liked: false,
      topSale: false,
      hotDeal: false),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/dell-g15.jpg",
      title: "HP Probook 445",
      specialOffer: false,
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
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
      topSale: false,
      hotDeal: false),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/dell-g15.jpg",
      title: "HP Probook 445",
      price: "36,500.00 EGP",
      specialOffer: false,
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
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
      topSale: true,
      hotDeal: false),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/dell-g15.jpg",
      title: "HP Probook 445",
      specialOffer: false,
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
        "assets/images/laptops/dell-g15.jpg",
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
      topSale: false,
      hotDeal: true),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/hp-probook-445.png",
      title: "Asus FX506HEB-B ...",
      specialOffer: true,
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
        "assets/images/laptops/hp-probook-445.png",
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
      recomended: true,
      latestItem: false,
      liked: false,
      topSale: true,
      hotDeal: false),
  Laptop(
      description: "DELL G15 5511 Gaming Laptop - Intel Core I7-11800H -...",
      image: "assets/images/laptops/apple-macbook -air13.png",
      title: "DELL Vostro 3510 ...",
      specialOffer: true,
      price: "36,500.00 EGP",
      discount: "20%",
      oldPrice: "3,500.00 EGP",
      productBrands: "Lenovo",
      images: [
        "assets/images/laptops/apple-macbook -air13.png",
        "assets/images/laptops/apple-macbook -air13.png",
        "assets/images/laptops/apple-macbook -air13.png",
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
      liked: true,
      topSale: false,
      hotDeal: false),
];
