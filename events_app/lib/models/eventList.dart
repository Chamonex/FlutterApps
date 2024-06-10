import './event.dart';

class EventList {

  late int cout;
  late List<Event> items;

  EventList(this.cout, this.items);

  EventList.fromJson(Map<String, dynamic> json) {
    List<Event> itemList = json["data"];

    cout = json["count"];
    items = itemList;
  }
}