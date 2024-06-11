import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/eventList.dart';

class ContentController {

  ContentController();

  Future<EventList> readJson() async {
    final response = await rootBundle.loadString('assets/activities.json');
    final Map<String, dynamic> jsonMap = jsonDecode(response);

    final EventList list = EventList.fromJson(jsonMap);

    return list;
  }

  // Future<EventList> readJsonByDay(int day) async {
  //   final response = await rootBundle.loadString('assets/activities.json');
  //   final Map<String, dynamic> jsonMap = jsonDecode(response);
  //   final Map<String, dynamic> filteredMap = {};
  //
  //   jsonMap.forEach((key, value) {
  //     if(key == "")
  //   })
  //
  //   final EventList list = EventList.fromJson(jsonMap);
  //
  //   return list;
  // }

}