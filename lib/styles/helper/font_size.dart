import 'package:mtsv4/styles/helper/scaling_utlis.dart';

/// Define font size list for project
/// medium = 16 as standar siz in device ~5"

class IfontSize {
  final double huge;
  final double xxbig;
  final double xbig;
  final double big;
  final double xxmedium;
  final double xmedium;
  final double medium;
  final double normal;
  final double small;
  final double verySmall;
  final double tiny;
  final double smallest;

  IfontSize(
      this.huge,
      this.xxbig,
      this.xbig,
      this.big,
      this.xxmedium,
      this.xmedium,
      this.medium,
      this.normal,
      this.small,
      this.verySmall,
      this.tiny,
      this.smallest);
}

final fontSizes = IfontSize(
  moderateScale(40, 0.3),
  moderateScale(34, 0.3),
  moderateScale(26, 0.3),
  moderateScale(22, 0.3),
  moderateScale(20, 0.3),
  moderateScale(19, 0.3),
  moderateScale(16, 0.3),
  moderateScale(15, 0.3),
  moderateScale(14, 0.3),
  moderateScale(12, 0.3),
  moderateScale(11, 0.3),
  moderateScale(10, 0.3),
);
