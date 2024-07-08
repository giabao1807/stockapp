import 'package:flutter/material.dart';

class GridDataHeader<T> {
  final String? title;
  final num width;
  final Alignment titleAlignment;
  final Alignment cellAlignment;
  final Widget Function()? titleRender;
  final Widget Function(T value, int index) cellRender;

  GridDataHeader({
     this.title,
    required this.width,
    required this.cellRender,
    this.titleRender,
    this.titleAlignment = Alignment.center,
    this.cellAlignment = Alignment.center,
  });
}
