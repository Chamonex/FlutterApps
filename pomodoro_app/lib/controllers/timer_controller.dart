import 'package:pomodoro_app/events/end_event.dart';
import 'package:pomodoro_app/events/timer_event.dart';
import 'package:pomodoro_app/events/start_event.dart';

import '../events/pomodoro_event.dart';
import '../models/timer.dart';

/**
 * A classe controller possui uma lista dos treinos que vou executar
 * E a função geradora que executa os treinos.
 */


class TimerController {
  List<Timer> timerList;

  TimerController({required this.timerList});

  /**
      Essa é uma GENERATOR FUNCTION.
      async*
      Ela envia uma sequência de eventos!

      o "return" envia só um dado, e FINALIZA a função. Não é o que
      queremos, então devemos usar o operador yield (substituto ao return)
      ele não mata a execução da função.
   **/

  Stream<PomodoroEvent> start() async* {
    yield StartEvent();

    for (Timer timer in timerList) {
      for (int miliseconds = timer.totalSeconds; miliseconds >= 0; miliseconds--) {

        await Future.delayed(const Duration(milliseconds: 1));

        yield TimerEvent(timer: timer, now: miliseconds);
      }
    }

    yield EndEvent();
  }
}