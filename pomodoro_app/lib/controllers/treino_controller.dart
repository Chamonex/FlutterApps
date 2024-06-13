import 'package:pomodoro_app/events/end_event.dart';
import 'package:pomodoro_app/events/exercicio_event.dart';
import 'package:pomodoro_app/events/start_event.dart';

import '../events/treino_event.dart';
import '../models/treino.dart';

class TreinoController {
  List<Treino> treinoTimers;

  TreinoController({required this.treinoTimers});


  /*
      Essa é uma GENERATOR FUNCTION.
      async*
      Ela envia uma sequência de eventos!

      o "return" envia só um dado, e FINALIZA a função. Não é o que
      queremos, então devemos usar o operador yield (substituto ao return)
      ele não mata a execução da função.
    */

  Stream<TreinoEvent> start() async* {
    yield StartEvent();

    for (Treino treino in treinoTimers) {
      for (int seconds = treino.seconds; seconds >= 0; seconds--) {
        // eséra um segundo
        await Future.delayed(const Duration(seconds: 1));
        // a cada segundo vai retornar o evento exercício com o treino atual
        // e o timer atual
        yield ExercicioEvent(treino: treino, now: seconds);
      }
    }

    yield EndEvent();
  }
}