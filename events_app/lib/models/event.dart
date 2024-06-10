class EventList {
  final int count;
  final List<Event> events;

  EventList(this.count, this.events);

  factory EventList.fromJson(Map<String, dynamic> json) {
    return EventList(
      json['count'],
      Event.fromJson(json['data']) as List<Event>
    );
  }
}

class Event {
  final String start;
  final String end;
  final String title;
  final String description;
  final String category;
  final String color;
  final String backgroundColor;
  final List<Location> locations;
  final String type;
  final List<Person> people;

  Event(this.start, this.end, this.title, this.description, this.category, this.color, this.backgroundColor, this.locations, this.type, this.people);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      json['start'],
      json['end'],
      json['title']['pt-br'],
      json['description']['pt-br'],
      json['category']['title']['pt-br'],
      json['category']['color'],
      json['category']['background-color'],
      Location.fromJson(json['location']) as List<Location>,
      json['type']['title']['pt-br'],
      Person.fromJson(json['people']) as List<Person>
    );
  }
}

class Location {
  final String location;

  Location(this.location);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      json['title']['pt-br']
    );
  }

}

class Person {
  final String title;
  final String name;
  final String institution;
  final String bio;
  final String picture;
  final String role;

  Person(this.title, this.name, this.institution, this.bio, this.picture, this.role);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['title'],
      json['name'],
      json['institution'],
      json['bio']['pt-br'],
      json['picture'],
      json['role']['label']['pt-br']
    );
  }

}