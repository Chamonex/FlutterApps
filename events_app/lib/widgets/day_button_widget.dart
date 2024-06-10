import 'package:flutter/material.dart';

class dayButtonWidget extends StatelessWidget {
  final int day;

  dayButtonWidget({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
