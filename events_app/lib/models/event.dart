
class Event {
  final String startString;
  final String endString;
  final String title;
  final String? description;
  final String category;
  final String? color;
  final String? backgroundColor;
  final List<Location>? locations;
  final String type;
  final List<Person>? people;

  late final DateTime start;
  late final DateTime end;

  Event({
    required this.startString,
    required this.endString,
    required this.title,
    required this.description,
    required this.category,
    required this.color,
    required this.backgroundColor,
    required this.locations,
    required this.type,
    required this.people,
  }) {
    start = DateTime.parse(startString);
    end = DateTime.parse(endString);
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      startString: json["start"],
      endString: json["end"],
      title: json["title"]["pt-br"],
      description: json["description"]["pt-br"] as String?,
      category: json["category"]["title"]["pt-br"],
      color: json["category"]["color"],
      backgroundColor: json["category"]["background-color"],

      locations: (json["locations"] as List)
          .map((location) => Location.fromJson(location))
          .toList(),
      type: json["type"]["title"]["pt-br"],

      people: (json["people"] as List)
          .map((person) => Person.fromJson(person))
          .toList(),
    );


  }
}

class Location {
  final String location;

  Location({
    required this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      location: json["title"]["pt-br"],
    );
  }
}

class Person {
  final String? title;
  final String? name;
  final String? institution;
  final String? bio;
  final String? picture;
  final String? role;

  Person({
    required this.title,
    required this.name,
    required this.institution,
    required this.bio,
    required this.picture,
    required this.role,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      title: json["title"],
      name: json["name"],
      institution: json["institution"],
      bio: json["bio"]["pt-br"],
      picture: json["picture"],
      role: json["role"]["label"]["pt-br"],
    );
  }

}