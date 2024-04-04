import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../Model/thuchi.dart';
import 'package:http/http.dart' as https;

class ThuChiRequest {
  static const String url = 'http://localhost:3000/ThuChi';

  static List<ThuChi> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<ThuChi> thuChi = list.map((model) => ThuChi.fromJson(model)).toList();
    return thuChi;
  }

  static Future<List<ThuChi>> fetchThuChis({int page = 1}) async {
    final response = await https.get(Uri.parse('http://localhost:3000/ThuChi'));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 400) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

  Future<ThuChi> createThuChi(String id, String thu, String chi) async {
    final response = await https.post(
      Uri.parse('http://localhost:3000/ThuChi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": id,
        "thu": thu,
        "chi": chi,
      }),
    );

    if (response.statusCode == 201) {
      return ThuChi.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create ThuChi.');
    }
  }
}