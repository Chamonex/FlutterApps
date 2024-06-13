import 'package:flutter/material.dart';
import 'package:pomodoro_app/events/end_event.dart';
import 'package:pomodoro_app/events/exercicio_event.dart';
import 'package:pomodoro_app/events/start_event.dart';
import '../controllers/treino_controller.dart';
import '../events/treino_event.dart';
import '../models/treino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showStartButton = true;
  late final TreinoController controller;
  late final Stream<TreinoEvent> treinoStream;

  start() {
    controller = TreinoController(treinoTimers: [
      Treino(name: 'Abdominal', seconds: 10),
      Treino(name: "Descanso", seconds: 5),
      Treino(name: "Prancha", seconds: 10),
    ]);
    setState(() {
      treinoStream = controller.start();
      showStartButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showStartButton ?
        ElevatedButton(
          onPressed: () {
            start();
          },
          child: Text("Iniciar Treino"),
        )
        : StreamBuilder(
          stream: treinoStream,
          builder: (BuildContext context, AsyncSnapshot<TreinoEvent> snapshot) {
            TreinoEvent? event = snapshot.data;
            if (snapshot.hasError) {
              return const Text("ERRO AO CARREGAR O TREINO");
            }
            else if (snapshot.hasData) {
              if (event is StartEvent) {
                return const Text("iniciando treino...");
              }
              else if (event is ExercicioEvent) {
                return Text("treino iniciado: ${event.now}");
              }
              else if (event is EndEvent) {
                return const Text("Treino finalizado");
              }
            }
            return Text("algo aconteceu...");
          },
        )
      ),
    );
  }
}
