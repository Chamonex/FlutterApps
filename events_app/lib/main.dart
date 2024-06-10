import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/event_page.dart';
import 'pages/speaker_page.dart';

void main() {
  runApp(const NovaGota());
}

class NovaGota extends StatelessWidget {
  const NovaGota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nova Gota",
      home: homePage(),
      // home: EventPage(),
      // home: SpeakerPage(),
    );
  }
}