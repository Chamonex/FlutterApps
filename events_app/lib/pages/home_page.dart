import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/day_button_widget.dart';
import '../widgets/event_widget.dart';
import'./event_page.dart';
import 'dart:convert';
import '../models/event.dart';

class homePage extends StatefulWidget {
  
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  EventList? _eventList;
  String _rbtest = "aa";

  void initState() {
    super.initState();
    print("INICIEI O STATE");
    _loadJson();
  }

  Future<void> _loadJson() async {
    String jsonString = await rootBundle.loadString("assets/activities.json");
    print("carreguei");
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    EventList e = EventList.fromJson(jsonMap);

    setState(() {
      _eventList = e;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 150,
        elevation: 4.0,
        backgroundColor: Color.fromRGBO(45, 61, 89, 1),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(_rbtest, style: TextStyle(fontSize: 25, color: Colors.white),),
            // Text('$_itensCount', style: TextStyle(fontSize: 25, color: Colors.white),), 
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
              child: const Text('Programação', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(250, 250, 250, 1),
              ),
              child: Expanded(
                child: Row(
                
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(30, 109, 195, 1)
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                    ),
                    const Expanded(
                      child: Center( 
                        child: Text("Exibindo todas atividadesss", style: TextStyle(fontSize: 15),),
                      )
                    )
                  ],
                )
              )
            )
          ]
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child:Container(
                      child: Text('Nov\n2023', textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(  // container para backgroundcolor
                    color: Color.fromRGBO(30, 109, 195, 1),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [dayButtonWidget(day: 26),
                      dayButtonWidget(day: 27),
                      dayButtonWidget(day: 28),
                      dayButtonWidget(day: 29),
                      dayButtonWidget(day: 30),],
                      
                    )
                  ),
                ],
              ), // menu para selecionar os dias
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => EventPage(
                    
                  )));
                },
                child: EventWidget(),
              ),
              EventWidget(),
              EventWidget(),
              EventWidget(),
              EventWidget(),
              EventWidget(),

            ],  // children column principal
          ),
          
        )
      )// Container que envolve todo o body para background
    );

    // ignore: dead_code
  }
}