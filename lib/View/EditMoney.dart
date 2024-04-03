import 'package:flutter/material.dart';
import 'package:kt2/View/CustomMoney.dart';
import '../Model/tiente.dart';
import '../Network/tiente_request.dart';

class EditMoney extends StatefulWidget {
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomMoney(name: '${editTienTe[index].name}', img: '${editTienTe[index].img}', symbol: '${editTienTe[index].symbol}')
                    ));
                  },
                  child: Row (
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CustomMoney(name: '${editTienTe[index].name}', img: '${editTienTe[index].img}', symbol: '${editTienTe[index].symbol}')
                            ));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                '${editTienTe[index].img}',
                                width: 32,
                              ),
                              Text('     ${editTienTe[index].name} - ', style: TextStyle(color: Colors.white),),
                              Text('${editTienTe[index].symbol}', style: TextStyle(color: Colors.white))
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