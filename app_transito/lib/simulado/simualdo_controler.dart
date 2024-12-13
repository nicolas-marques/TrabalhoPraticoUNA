
import 'package:app_transito/simulado/simulado_repository.dart';
import 'package:app_transito/simulado/simulado_state.dart';

import 'package:app_transito/shared/models/quiz_model.dart';
import 'package:app_transito/shared/models/usewr_model.dart';
import 'package:flutter/foundation.dart';

class SimuladoControler {
  final stateNotifierw = ValueNotifier<SimuladoState>(SimuladoState.empty);
  set state(SimuladoState state) => stateNotifierw.value = state;
  SimuladoState get state => stateNotifierw.value;

  UserModel user;
  List<QuizModel> quizzes;

  final repository = SimuladoRepository();

  

  void getQuizzes() async{
    state = SimuladoState.loading;  
    quizzes = await repository.getQuizzers();
    state = SimuladoState.success;
  }
  
}
