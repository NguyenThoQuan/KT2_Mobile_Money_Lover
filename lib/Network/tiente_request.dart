import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../Model/tiente.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'http://localhost:3000/TienTe';

  static List<TienTe> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    // list = list.reversed.toList();
    List<TienTe> tienTe = list.map((model) => TienTe.fromJson(model)).toList();
    return tienTe;
  }

  static Future<List<TienTe>> fetchTienTes({int page = 1}) async {
    final response = await http.get(Uri.parse('http://localhost:3000/TienTe'));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 400) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}