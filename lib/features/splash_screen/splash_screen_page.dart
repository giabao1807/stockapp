import 'package:flutter/material.dart';
import 'package:mtsv4/application_config.dart';
import 'package:mtsv4/main.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<StatefulWidget> createState() => SplashWidgetState();
}

class SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    // loadInFirstRun();
  }

  @override
  Widget build(BuildContext context) {
    if (!appConfig!.shortName.isNotEmpty) {
      return const CircularProgressIndicator();
    } else {
      // return const MyHomePage(title: 'Flutter Home Page');
      return const MyHomePage();
    }
  }
}
