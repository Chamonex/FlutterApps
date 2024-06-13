import 'package:flutter/material.dart';
import '../controller/content_controller.dart';

class dayButtonWidget extends StatelessWidget {
  final int day;
  final ContentController controller;

  dayButtonWidget({
    super.key,
    required this.day,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // vai adicionar um item na stream
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Text(
        day.toString(),
        style: TextStyle(color: Color.fromRGBO(176, 195, 225, 1), fontSize: 20),
      ),
    );
  }
}
