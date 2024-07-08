import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mtsv4/styles/helper/scaling_utlis.dart';

double moderate(double size, [double factor = 1.0]) => moderateScale(size, factor);
double vertical(double size, [double factor = 1.0]) => verticalScale(size, factor);

double indent = moderateScale(16, 0.3); //-- 16 is margin size with standard device ~5"
double halfIndent = moderateScale(indent / 2, 0.3);
double doubleIndent = moderateScale(indent * 2, 0.3);

double verticalIndent = verticalScale(14, 0.3);
double halfVerticalIndent = verticalScale(7, 0.4);

const double borderRadius = 4;

double iconSize = moderateScale(25, 0.4);
double bigIconSize = moderateScale(40, 0.3);
double iconMargin = 16; // For Android, since there's no direct equivalent to React Native's Platform.OS === 'android' ? 16 : 10;

//-- defined width of any screen
// double containerWidth = MediaQuery.of(context).size.width - indent * 2;
double WIDTH =  WidgetsBinding.instance.window.physicalSize.width;
double HIEGHT = WidgetsBinding.instance.window.physicalSize.height;
bool IOS = Platform.isIOS;

