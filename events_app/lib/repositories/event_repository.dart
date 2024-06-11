import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class EventRepository {

  late Map<String, dynamic> jsonData;

  Future<void> loadJsonData() async {
    // read json data
    String jsonString = await rootBundle.loadString('assets/test.json');
    // converter
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    jsonData = jsonMap;
  }

  String toString() {
    return "${jsonData}";
  }
}