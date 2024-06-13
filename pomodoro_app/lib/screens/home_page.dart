import 'package:flutter/material.dart';
import 'package:pomodoro_app/events/end_event.dart';
import 'package:pomodoro_app/events/start_event.dart';
import 'package:pomodoro_app/events/timer_event.dart';
import '../controllers/timer_controller.dart';
import '../events/pomodoro_event.dart';
import '../models/timer.dart';

import '../widgets/circular_progress.dart';
import '../widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool showCircularProgress = false;
  /// instancia do controller
  late final TimerController controller;
  /// receber o stream enviado pelo controller
  late final Stream<PomodoroEvent> timerStream;

  start() {
    controller = TimerController(timerList: [
      Timer(totalSeconds: 1000000),
      Timer(totalSeconds: 50000),
    ]);
    setState(() {
      timerStream = controller.start();
      showCircularProgress = true;
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 32, 65, 1),
      floatingActionButton: MyButton(tapFunction: start,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showCircularProgress? StreamBuilder(
                stream: timerStream,
                builder: (context, AsyncSnapshot<PomodoroEvent> snapshot) {
                  PomodoroEvent? event = snapshot.data;
                  if (snapshot.hasError) {
                    return Text("ERRO");
                  }
                  else if (snapshot.hasData) {
                    if (event is TimerEvent) {
                      return MyCircularIndicator(
                          currentSeconds: event.now,
                          totalSeconds: event.timer.totalSeconds,
                      );
                    }
                    else if (event is StartEvent) {
                      return MyCircularIndicator(currentSeconds: 1, totalSeconds: 1);
                    }
                    else if (event is EndEvent) {
                      return Text("acabou");
                    }
                  }
                  return const Text("LOADING...");
                }
            ) : Container(
              child: Text(""),
            )
          ],
        ),
      ),
    );
  }
}
