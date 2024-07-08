import 'package:flutter/widgets.dart';

Size _screenSize = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
double statusBarHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top;
double navigationBarHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).padding.bottom;
Size contentSize = Size(_screenSize.width,
    _screenSize.height - statusBarHeight - navigationBarHeight);

final double shortDimension = contentSize.width < contentSize.height
    ? contentSize.width
    : contentSize.height;
final double longDimension = contentSize.width < contentSize.height
    ? contentSize.height
    : contentSize.width;

const double guidelineBaseWidth = 375;
const double guidelineBaseHeight = 1069;

double scale(double size) {
  return (shortDimension / guidelineBaseWidth) * size;
}

double scaleHeight(double size) {
  return (longDimension / guidelineBaseHeight) * size;
}

double verticalScale(double size, [double factor = 0.3]) {
  return size + (scaleHeight(size) - size) * factor;
}

double moderateScale(double size, [double factor = 0.3]) {
  return size + (scale(size) - size) * factor;
}
