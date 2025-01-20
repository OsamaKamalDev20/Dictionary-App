import 'dart:convert';

import 'package:flutter_ui_designs/Dictionary%20App/dictionary_model.dart';
import 'package:http/http.dart' as http;

class DictionaryAPIServices {
  static String baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  static Future<DictionaryModel?> fetchData(String word) async {
    Uri url = Uri.parse("$baseURL$word");
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return DictionaryModel.fromJson(data[0]);
      } else {
        throw Exception("Failure to load meaning");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
