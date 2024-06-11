import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/restaurant.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
      () => 'Data load',
  );

  Future<Restaurant> readJson() async {
    final response = await rootBundle.loadString('lib/assets/test.json');
    final Map<String, dynamic> jsonMap = jsonDecode(response);

    final Restaurant restaurant = Restaurant.fromJson(jsonMap as Map<String, dynamic>);

    return restaurant;
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Restaurant>(
        future: readJson(),
        builder: (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
          List<Widget> children;

          if(snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Result: ${snapshot.data}"),
              )
            ];
          }
          else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("ERRO: ${snapshot.error}"),
              )
            ];
          }
          else {
            children = <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("loading data"),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
