import 'package:flutter/material.dart';

class EventError extends StatelessWidget {
  const EventError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "FALHA AO CARREGAR WIDGET",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
