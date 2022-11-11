Enum? device;
getDevice(double? width) {
  if (width! < 650) {
    device = DeviceType.Mobile;
  } else if (width <= 1100 && width >= 650) {
    device = DeviceType.Tablet;
  } else {
    device = DeviceType.Desktop;
  }
}

enum DeviceType { Mobile, Tablet, Desktop }

double doubleResponsiveSize(
    double? min, double? max, double? mainFont, double deviceWidth,
    {double? forMobile}) {
  if (deviceWidth <= 360 && forMobile != null) {
    return forMobile;
  } else if (deviceWidth / mainFont! > max!) {
    return max;
  } else if (deviceWidth / mainFont < min!) {
    return min.toDouble();
  } else {
    return (deviceWidth / mainFont);
  }
}

double sizesResponsive(
    {double? mobile, double? teblet, double? desktop, Enum? device}) {
  if (device! == DeviceType.Mobile) {
    return mobile!;
  } else if (device == DeviceType.Tablet) {
    return teblet!;
  } else {
    return desktop!;
  }
}

double responsive(
    {Map test = const {},
    double? smallestElement,
    double? smallestWidth,
    double? meduimElement,
    double? mediumWidth,
    double? largeElement,
    double? largeWidth,
    double? device}) {
  /* if (test["red"] == "red") {
    print(test);
  }*/
  if (device! < smallestWidth!) {
    return smallestElement!;
  } else if (device < mediumWidth!) {
    return meduimElement!;
  } else {
    return largeElement!;
  }
}
