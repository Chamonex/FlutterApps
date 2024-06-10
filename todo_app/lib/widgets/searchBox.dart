import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/homePage.dart';

class searchBox extends StatelessWidget {
  final changeFunction;

  const searchBox({
    super.key, required this.changeFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: TextField(
        onChanged: (value) => changeFunction(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),

      ),
    );
  }
}