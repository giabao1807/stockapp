// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mtsv4/styles/helper/font_size.dart';

class IconTextButton extends StatelessWidget {
  IconData? icon;
  final String text;
  final VoidCallback onPressed;
  Color? color;

  IconTextButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: fontSizes.normal, color: color),
          ),
        ],
      ),
    );
  }
}
