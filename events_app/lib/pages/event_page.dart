import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {

  EventPage({super.key});


  @override
  State<EventPage> createState() => _EventPageState();

}

class _EventPageState extends State<EventPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 4.0,
        shadowColor: Colors.black,
        backgroundColor: Color.fromRGBO(45, 61, 89, 1),
        title: Text('Events Flutter App', style: TextStyle(fontSize: 25, color: Colors.white),),
      ),

      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
              width: double.infinity,
              color: Colors.purple,   // PEGAR DO JSON
              child: Text("Astrofísica e Cosmologia", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.95)),),   // PEGAR DO JSON
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: const Text(
                "Astrifísica e Relativista: Explorando as Previsões de Einstein",   // PEGAR DO JSON
                style: TextStyle(
                  height: 1.2,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 18,
                        color: Color.fromRGBO(30, 109, 195, 1),
                      ),
                      // PEGAR DO JSON
                      Text(" Domingo 07:00 - 08:00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                      // PEGAR DO JSON
                      Text(" Belo Horizonte", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )],
                        color: const Color.fromRGBO(30, 109, 195, 1)
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          "Adicionar à sua agenda",
                          style: TextStyle(
                            color: Color.fromRGBO(250, 250, 250, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 50),
                    // PEGAR DO JSON
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 50),
                    // PEGAR DO JSON
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text(
                            "Palestrante",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(  // MUDAR, USAR OUTRO WIDGET
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  width: 50,
                                  'https://static.galoa.com.br/file/Eventmanager-Private/styles/large/s3/eventmanager_person/Screenshot%202023-10-10%20at%2013.06.35.png?VersionId=4_z9e083e414507696175f50716_f10473fd681469d07_d20231010_m160744_c003_v0312007_t0020_u01696954064581&itok=XSqu4FiW',
                                ),
                              ),
                            ),
                            const Column(   // MUDARR USAR OUTRO
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pedro Chamone", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                Text("Universidade de São Paulo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(75, 75, 75, 0.7),),),
                              ],
                            )
                          ],
                        ), 
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}