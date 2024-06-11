import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../pages/event_page.dart';
import '../models/event.dart';

class EventWidget extends StatefulWidget {
  final Event event;

  EventWidget({super.key, required this.event}); // required event

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  late Person person;

  @override
  void initState() {
    super.initState();
    if ( widget.event.people != null && widget.event.people!.isNotEmpty) {
      person = widget.event.people![0];
    } else {
      person = Person(
        name: null,
        title: 'none',
        institution: "none",
        bio: 'none',
        picture: 'none',
        role: 'none',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 5, 5),
        color: Colors.white,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            color: Colors.purple, // PEGAR DO JSON
            elevation: 3,
            child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Text(widget.event.type,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ),
                        Text(widget.event.title,
                            style: TextStyle(
                              height: 1.1,
                              fontSize: 16,
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(person.name ?? "have no palestrant",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(75, 75, 75, 0.7),
                              )),
                        ),
                      ],
                    )))));
  }
}
