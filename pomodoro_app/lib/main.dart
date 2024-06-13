import 'package:flutter/material.dart';
import './screens/home_page.dart';
// https://www.youtube.com/watch?v=BSeUg2YHe6U
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pomodoro_app',
      home: const HomePage(),
    );
  }
}
