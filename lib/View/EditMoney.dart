import 'package:flutter/material.dart';
import '../Model/tiente.dart';
import '../Network/tiente_request.dart';

class EditMoney extends StatefulWidget {
  const EditMoney({super.key});

  @override
  State<StatefulWidget> createState() => EditMoneyState();
}

class EditMoneyState extends State<EditMoney> {
  List<TienTe> editTienTe = [];
  
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchTienTes().then((dataTienTeFromServer) {
      setState(() {
        editTienTe = dataTienTeFromServer;
      });
    });
  }
  
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
          itemCount: editTienTe.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton (
                  onPressed: () {}, 
                  child: Row (
                    children: [
                      TextButton(
                          onPressed: () {}, 
                          child: Row(
                            children: [
                              Text('${editTienTe[index].name} - '),
                              Text('${editTienTe[index].symbol}')
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }

}