import 'package:pomodoro_app/events/pomodoro_event.dart';
import '../models/timer.dart';

/// este evento vai ser disparado todo segundo, passando os segundos atuais e o nome do treino
class TimerEvent implements PomodoroEvent {
  Timer timer;
  int now; // tempo no momento
  TimerEvent({required this.timer, required this.now});

}
