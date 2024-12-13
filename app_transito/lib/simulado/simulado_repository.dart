import 'dart:convert';
import 'package:app_transito/shared/models/quiz_model.dart';
import 'package:dio/dio.dart';

class SimuladoRepository {
  Future<List<QuizModel>> getQuizzers() async {
    var response = await Dio().get(
        'http://10.0.2.2:3000/Simulado');
    final list = (response.data as List).map((item) {
      return QuizModel.fromJson(item);
    }).toList(); 
    return list;
  }
}
//https://my-json-server.typicode.com/AndreLuiz-JService/DataBase2/Simulado