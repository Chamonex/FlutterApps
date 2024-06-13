import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/day_button_widget.dart';
import '../widgets/event_widget.dart';
import '../widgets/error_widgets/event_error_widget.dart';
import'../controller/content_controller.dart';


class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  final ContentController controller = ContentController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 150,
          elevation: 4.0,
          backgroundColor: Color.fromRGBO(45, 61, 89, 1),
          title: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              'Events Flutter App',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
              child: const Text(
                'Programação',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
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
                          color: const Color.fromRGBO(30, 109, 195, 1)),
                      child: const Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                    ),
                    const Expanded(
                        child: Center(
                      child: Text(
                        "Exibindo todas atividadesss",
                        style: TextStyle(fontSize: 15),
                      ),
                    ))
                  ],
                )))
          ]),
        ),
        body: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        'Nov\n2023',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                      // container para backgroundcolor
                      color: Color.fromRGBO(30, 109, 195, 1),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          dayButtonWidget(day: 26, controller: controller,),
                          dayButtonWidget(day: 27, controller: controller,),
                          dayButtonWidget(day: 28, controller: controller,),
                          dayButtonWidget(day: 29, controller: controller,),
                          dayButtonWidget(day: 30, controller: controller,),
                        ],
                      )),
                ],
              ), // menu para selecionar os dias

              FutureBuilder<dynamic>(
                  // preciso de uma stream que saia dos botões de data
                  // e passe o dia para o metodo filterJson()
                  future: controller.filterJson(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded( child: ListView.builder(
                        itemCount: snapshot.data.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              title: EventWidget(
                            event: snapshot.data.items[index],
                          ));
                        },
                      ));
                    } else if (snapshot.hasError) {
                      print("ERROR");
                      return EventError();
                    } else {
                      return Text("LOADING");
                    }
                  })
            ], // children column principal
          ),
        ) // Container que envolve todo o body para background
        );

    // ignore: dead_code
  }
}
