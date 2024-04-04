import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import '../Model/thuchi.dart';
import 'main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:kt2/Network/thuchi_request.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<StatefulWidget> createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
  final TextEditingController _controllerThu = TextEditingController();
  final TextEditingController _controllerChi = TextEditingController();
  Future<ThuChi>? _futureThuChi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm giao dịch'),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      Text("   "),
                      Expanded(
                          child: TextField(
                            controller: _controllerThu,
                            decoration: InputDecoration(
                              hintText: "Nhập số tiền thu"
                            ),
                          )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        Text("   "),
                        Expanded(
                            child: TextField(
                              controller: _controllerChi,
                              decoration: InputDecoration(
                                  hintText: "Nhập số tiền chi"
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.edit_note),
                        TextButton(
                            onPressed: () {},
                            child: Text("Thêm ghi chú", style: TextStyle(color: Colors.white54),)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.date_range, color: Colors.white,),
                        TextButton(
                            onPressed: () {},
                            child: Text("Hôm nay", style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet, color: Colors.white,),
                        TextButton(
                            onPressed: () {},
                            child: Text("Tiền mặt", style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: 465,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _futureThuChi = createThuChi(_controllerThu.text, _controllerChi.text);
            });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(symbol: '',))
            );
          },
          child: Text("Lưu"),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Future<ThuChi> createThuChi(String thu, String chi) async {
    final response = await https.post(
      Uri.parse('http://localhost:3000/ThuChi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
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

  FutureBuilder<ThuChi> buildFutureBuilder() {
    return FutureBuilder<ThuChi>(
      future: _futureThuChi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.thu.toString());
        } else if (snapshot.hasData) {
          return Text(snapshot.data!.chi.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}