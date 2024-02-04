import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_chance/src/controller/game_controller.dart';
import 'package:second_chance/src/core/localization/strings.dart';
import 'package:second_chance/src/core/theme/theme.dart';
import 'package:second_chance/src/pages/my_home_page.dart';

void main() {
  Get.put(GameController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeClass.theme(context),
      home: const MyHomePage(),
    );
  }
}
