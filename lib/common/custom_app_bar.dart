// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/styles/theme/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    bool? isShowBackBtn,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  bool? isShowBackBtn = true;

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(title, isShowBackBtn);
}

class _CustomAppBarState extends State<CustomAppBar> {
  _CustomAppBarState(String title, bool? isShowBackBtn);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title.tr,
        style: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
      ),
      backgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
      leading: BackButton(
        color: styles['PRIMARY__CONTENT__COLOR']!.toColor(),
      ),
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
