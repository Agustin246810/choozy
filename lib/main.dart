import 'package:choozy/choozy_screen.dart';

import 'package:choozy/screens/home_screen/choozy_screen_3.dart';
import 'package:choozy/screens/settings_screen/ajustes_screen.dart';
import 'package:choozy/screens/home_screen/choozy_screen_design.dart';
import 'package:choozy/screens/test_screen/test_screen.dart';
import 'package:choozy/screens/theme_screen/temas_screen.dart';
import 'package:choozy/screens/tutorial_screen/tutorial_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Choozy',
      theme: ThemeData.dark(),
      home: const TestPage(),
      routes: {
        const ChoozyScreenDesign().id: (_) => const ChoozyScreenDesign(),
        const TutorialScreen01().id: (_) => const TutorialScreen01(),
        const TutorialScreen02().id: (_) => const TutorialScreen02(),
        const TutorialScreen03().id: (_) => const TutorialScreen03(),
        const TemmasScreen().id: (_) => const TemmasScreen(),
        const SettingsScreen().id: (_) => const SettingsScreen(),
      },
    );
  }
}
