// typedef TFontWeightValue = "normal" | "bold" | "100" | "200" | "300" | "400" | "500" | "600" | "700" | "800" | "900" | Null;

import 'package:flutter/cupertino.dart';

class IFontWeights {
  final FontWeight thin;
  final FontWeight extraLight;
  final FontWeight light;
  final FontWeight normal;
  final FontWeight medium;
  final FontWeight semiBold;
  final FontWeight bold;
  final FontWeight extraBold;
  final FontWeight heavy;

  IFontWeights(this.thin, this.extraLight, this.light, this.normal, this.medium, this.semiBold, this.bold, this.extraBold, this.heavy);
}

var fontWeights = IFontWeights(FontWeight.w100, FontWeight.w200, FontWeight.w300, FontWeight.w400, FontWeight.w500, FontWeight.w600, FontWeight.w700, FontWeight.w800, FontWeight.w900,);

