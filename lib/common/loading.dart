import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showLoading(BuildContext context, String message) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message.tr),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
        );
      });
}
