import 'package:flutter/material.dart';
import 'package:intro_ui_lesson_4/pages/home_page.dart';
import 'package:intro_ui_lesson_4/pages/intro_ui_online_task_page.dart';
import 'package:intro_ui_lesson_4/pages/intro_ui_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const IntroUIPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        IntroUIPage.id: (context) => const IntroUIPage(),
        IntroUIOnlineTaskPage.id: (context) => const IntroUIOnlineTaskPage(),
      },
    );
  }
}