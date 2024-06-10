import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import '../models/event.dart';

class EventWidget extends StatefulWidget {
  // Event event;

  EventWidget({super.key}); // required event
  
  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 5, 5),
      color: Colors.white,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2)
        ),
        color: Colors.purple,     // PEGAR DO JSON
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
                  child: const Text(
                    "Mesa redonda de 07:00 até as 08:00",       // PEGAR DO JSON
                    style: TextStyle(
                      fontSize: 12,
                    )
                  ),
                ),
                Text(
                  "A fisica forerosa de Buracos Negros Supermassivos uau brake line",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 16,
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: const Text(
                    "Pedro Chamone",       // PEGAR DO JSON
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(75, 75, 75, 0.7),
                    )
                  ),
                ),
              ],
            )
          )
        )
      )
    );
 }
}