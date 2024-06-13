import 'package:pomodoro_app/events/treino_event.dart';
import '../models/treino.dart';


class ExercicioEvent implements TreinoEvent {
  Treino treino;
  int now; // tempo no momento
  ExercicioEvent({required this.treino, required this.now});

}
