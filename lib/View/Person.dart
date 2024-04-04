import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt2/View/EditMoney.dart';
import 'main.dart';
import 'CustomMoney.dart';
import 'NewTransaction.dart';

class Person extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => PersonState();
}

class PersonState extends State<Person> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài khoản"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 36),
                child: Text('Xin chào Nguyễn Thọ Quân', style: TextStyle(fontSize: 24),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Card(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomMoney(name: 'Việt Nam', img: 'assets/vn.jpg', symbol: 'VND',)
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.attach_money, color: Colors.white54,),
                        Text("Đơn vị tiền tệ", style: TextStyle(color: Colors.white),),
                        Icon(Icons.chevron_right, color: Colors.white54)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              label: "Tổng quan"
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_wallet),
            ),
            label: "Sổ giao dịch",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewTransaction())
                  );
                },
                icon: Icon(Icons.add, size: 36,),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.paid),
              label: "Ngân sách"
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Person()
                  ));
                },
                icon: Icon(Icons.person),
              ),
              label: "Tài khoản"
          )
        ],
        selectedItemColor: Colors.white54,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}