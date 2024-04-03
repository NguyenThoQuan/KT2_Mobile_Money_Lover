import 'package:flutter/material.dart';
import 'EditMoney.dart';
import 'main.dart';

class CustomMoney extends StatefulWidget {
  const CustomMoney({super.key});

  @override
  State<StatefulWidget> createState() => CustomMoneyState();
}

class CustomMoneyState extends State<CustomMoney> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 64.0),
                child: Text("Chọn đơn vị tiền tệ bạn sử dụng", style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text("Bạn có thể thay đổi sang đơn vị tiền khác bất cứ lúc nào.", style: TextStyle(color: Colors.white54),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.flag),
                        Text("Việt Nam Đồng"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditMoney())
                              );
                            },
                            child: Text("SỬA", style: TextStyle(color: Colors.green),)
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
      floatingActionButton: Container(
        width: 465,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage())
            );
          },
          child: Text("Lưu"),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
  
}
