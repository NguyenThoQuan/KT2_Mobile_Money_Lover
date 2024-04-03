import 'package:flutter/material.dart';

class EditMoney extends StatefulWidget {
  const EditMoney({super.key});

  @override
  State<StatefulWidget> createState() => EditMoneyState();
}

class EditMoneyState extends State<EditMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn vị tiền tệ"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(

      )
    );
  }

}