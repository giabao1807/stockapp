import 'package:flutter/material.dart';
import 'package:mtsv4/utils/constants/common_colors.dart';
import 'package:mtsv4/extentions.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  String? backgroundColor;
  InputWidget(
      {super.key,
      required this.controller,
      required this.placeHolder,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor?.toColor(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.all(24),
          focusColor: black,
          // hintText: placeHolder,
          labelText: placeHolder,
          hintStyle: const TextStyle(fontSize: 16)),
    );
  }
}
