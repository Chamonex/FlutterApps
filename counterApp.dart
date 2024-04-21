import 'package:flutter/material.dart';


class OurButton extends StatelessWidget {

  late String text;
  late Color textColor, backgroundColor, splashColor;
  final VoidCallback onPressed;

  OurButton({super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.splashColor
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      splashColor: splashColor,
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
      shape: StadiumBorder(),
    );
  }
}


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter App",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String _displayedString;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == 0) {
      _displayedString = "none";
    } else {
      _displayedString = _counter.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('An app can count to $_counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            Text(
              "$_displayedString",
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
            TextButton(
              onPressed: _resetCounter,
              child: Text("reset counter",
              style: TextStyle(fontSize: 20),),

            )
          ],
        ),
      ),
      floatingActionButton: OurButton(
        text: 'Make the counter ${_counter+1}',
        textColor: Colors.white,
        backgroundColor: Colors.blue,
        splashColor: Colors.lightBlue,
        onPressed: _incrementCounter,
      ),


    );
  }
}
