import './event.dart';

class EventList {
  late int count;
  late List<Event> items;

  EventList({
    required this.count,
    required this.items,
  });

  factory EventList.fromJson(Map<String, dynamic> json) {
    return EventList(
      count: json['count'],
      items: (json['data'] as List)
        .map((events) => Event.fromJson(events))
        .toList(),
    );
  }
}
