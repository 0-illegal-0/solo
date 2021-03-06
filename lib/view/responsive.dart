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
