import 'package:flutter/material.dart';
import '../widgets/event_widget.dart';

class SpeakerPage extends StatefulWidget {
  const SpeakerPage({super.key});

  @override
  State<SpeakerPage> createState() => _SpeakerPageState();
}

class _SpeakerPageState extends State<SpeakerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 4.0,
        shadowColor: Colors.black,
        backgroundColor: Color.fromRGBO(45, 61, 89, 1),
        title: Text('Chuva ❤️ Flutter', style: TextStyle(fontSize: 25, color: Colors.white),),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          color: Color.fromRGBO(250, 250, 250, 1),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        width: 100,
                        'https://static.galoa.com.br/file/Eventmanager-Private/styles/large/s3/eventmanager_person/Screenshot%202023-10-10%20at%2013.06.35.png?VersionId=4_z9e083e414507696175f50716_f10473fd681469d07_d20231010_m160744_c003_v0312007_t0020_u01696954064581&itok=XSqu4FiW',
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PEGAR DO JSON
                      Text("Stephen Willian Hawking", style: TextStyle(fontSize: 25,overflow: TextOverflow.ellipsis,  fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                    ),
                    Text(
                      // PEGAR DO JSON
                      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Atividades",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: const Text(
                        "dom, 26/02/24",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                    ),
                    
                    // EventWidget(),
                    // EventWidget(),
                    // EventWidget(),
                    // EventWidget(),
                    // EventWidget(),
                    // EventWidget(),
                  ],
                )
              ),
            ],
          ),
        ),
      )
      
    );
  }
}