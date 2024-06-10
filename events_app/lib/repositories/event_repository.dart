import 'dart:convert';
import 'package:flutter/services.dart';

class EventRepository {

  List _items = [];

  Future <void> readJson() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final data = await json.decode(response);
    
    _items = data["items"];
  }

}