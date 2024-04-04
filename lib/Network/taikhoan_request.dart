import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:kt2/Model/taikhoan.dart';
import 'package:http/http.dart' as https;

class TaiKhoanRequest {
  static const String url = 'http://localhost:3000/TaiKhoan';

  static List<TaiKhoan> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<TaiKhoan> taiKhoan = list.map((model) => TaiKhoan.fromJson(model)).toList();
    return taiKhoan;
  }

  static Future<List<TaiKhoan>> fetchTaiKhoans({int page = 1}) async {
    final response = await https.get(Uri.parse('http://localhost:3000/TaiKhoan'));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 400) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

  Future<TaiKhoan> createTaiKhoan(String username, String password) async {
    final response = await https.post(
      Uri.parse('http://localhost:3000/TaiKhoan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 201) {
      return TaiKhoan.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create ThuChi.');
    }
  }
}