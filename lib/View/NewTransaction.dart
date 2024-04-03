import 'package:flutter/material.dart';

import 'main.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<StatefulWidget> createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
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
                            decoration: InputDecoration(
                              hintText: "0"
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
                        TextButton(
                            onPressed: () {},
                            child: Text("Chọn nhóm", style: TextStyle(color: Colors.white54, fontSize: 20),)
                        ),
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

}