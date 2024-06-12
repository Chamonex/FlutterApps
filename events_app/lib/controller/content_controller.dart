import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/eventList.dart';
import '../models/event.dart';

class ContentController {

  ContentController();

  Future<EventList> readAllJson() async {
    final response = await rootBundle.loadString('assets/activities.json');
    final Map<String, dynamic> jsonMap = jsonDecode(response);

    final EventList list = EventList.fromJson(jsonMap);

    return list;
  }

  Future<EventList> filterJson(int day) async {
    final response = await rootBundle.loadString('assets/activities.json');
    final Map<String, dynamic> jsonMap = jsonDecode(response);

    final EventList list = EventList.fromJson(jsonMap);

    List<Event> filteredList = [];

    for (Event e in list.items) {
      int eDay = e.start.day;
      if (eDay == day) {
        filteredList.add(e);
      }
    }
    int size = filteredList.length;

    EventList finalEventList = EventList(count: size, items: filteredList);
    return finalEventList;
  }

}