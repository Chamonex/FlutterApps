import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/eventList.dart';
import '../models/event.dart';

class ContentController {

  ContentController();

  int day = 26;
  StreamController<double> buttonController = StreamController<double>();

  void changeDay() {
    Stream stream = buttonController.stream;
    stream.listen((day) {
      this.day = day as int;
      print("\n\n OMGG -> ${day}");
    });
  }

  Future<EventList> filterJson() async {
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