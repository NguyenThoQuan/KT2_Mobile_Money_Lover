import 'package:flutter/material.dart';
import 'EditMoney.dart';
import 'main.dart';

class CustomMoney extends StatefulWidget {
  final String name;
  final String img;
  final String symbol;

  CustomMoney({required this.name, required this.img, required this.symbol});

  @override
  State<StatefulWidget> createState() => CustomMoneyState(name: name, img: img, symbol: symbol);
}

class CustomMoneyState extends State<CustomMoney> {
  final String name;
  final String img;
  final String symbol;
  String symbolData = '';
  String imgData = '';
  String nameData = '';

  CustomMoneyState({required this.name, required this.img, required this.symbol});

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
                        Image.asset(img, width: 32,),
                        Text(name),
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
        width: 475,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              symbolData = symbol;
              imgData = img;
              nameData = name;
            });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(symbol: symbolData, img: imgData, name: nameData))
            );
          },
          child: Text("Lưu"),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
  
}
