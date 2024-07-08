import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const RoundedButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.backgroundColor = Colors.green,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromWidth(MediaQuery.of(context).size.width - 100))),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 14),
      ),
    );
  }
}
