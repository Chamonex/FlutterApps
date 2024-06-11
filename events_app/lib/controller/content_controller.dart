import 'package:flutter/services.dart';

class ContentController {
  // receber e decodificar o json em uma EventList


  Future<String> function(String path) async {
    String jsonString = await rootBundle.loadString("assets/activities.json");
    if (jsonString.isNotEmpty) {
      print("SUCESSO AO CARREGAR JSON");
      return jsonString;
    }
    else {
      print("ERRO");
      return "ERRO AO CARREGAR JSON";

    }
  }

}