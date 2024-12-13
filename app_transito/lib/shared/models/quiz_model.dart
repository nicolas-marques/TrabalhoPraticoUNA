

import 'package:app_transito/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this];
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito"
      }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> question;
  final int questionAwnsered;
  final String imagem;
  final Level level;

  QuizModel({
    this.title,
    this.question,
    this.questionAwnsered = 0,
    this.imagem,
    this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'question': question.map((x) => x.toMap()).toList(),
      'questionAwnsered': questionAwnsered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      title: json['title'],
      question: List<QuestionModel>.from(
      json['question']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsered: json['questionAwnsered'],
      imagem: json['imagem'],
      level: json['level'].toString().parse,
    );
  }


}
