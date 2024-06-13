import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final tapFunction;

  const MyButton({super.key, required this.tapFunction});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: FloatingActionButton(
        onPressed: () {
          widget.tapFunction();
        },
        child: Text(
          "Start",
          style: TextStyle(
            fontSize: 20
          ),
        ),

        backgroundColor: Color.fromRGBO(75, 63, 114, 1),
        foregroundColor: Colors.white,
          elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        )
      ),
    );
  }
}
