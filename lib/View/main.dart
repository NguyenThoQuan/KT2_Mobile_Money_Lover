import 'package:flutter/material.dart';
import 'package:kt2/Network/thuchi_request.dart';
import 'package:kt2/View/Person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/thuchi.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'NewTransaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black87,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage()
        },
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String symbol;
  final String img;
  final String name;

  HomePage({required this.symbol, required this.img, required this.name});

  @override
  State<StatefulWidget> createState() => HomeState(symbol: symbol, img: img, name: name);
}

class HomeState extends State<HomePage> {

  List<ThuChi> stateThuChi = [];

  final String symbol;
  final String img;
  final String name;
  String symbolData = '';
  String imgData = '';
  String nameData = '';

  HomeState({required this.symbol, required this.img, required this.name});

  final GlobalKey _tooltipKey = GlobalKey();
  double sizeInkWell = 0;

  @override
  void initState() {
    super.initState();
    ThuChiRequest.fetchThuChis().then((dataTienTeFromServer) {
      setState(() {
        stateThuChi = dataTienTeFromServer;
      });
    });
  }

  int calculateTotal(String field) {
    int total = 0;
    for (var item in stateThuChi) {
      if (field == 'thu') {
        total += int.parse(item.thu!);
      } else if (field == 'chi') {
        total += int.parse(item.chi!);
      }
    }

    if (symbol == '\$') {
      total = (total / 24000).round();
    } else if (symbol == 'Euro') {
      total = (total / 27000).round();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    int totalThu = calculateTotal('thu');
    int totalChi = calculateTotal('chi');
    int totalMoney = totalThu - totalChi;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("$totalMoney $symbol", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                      IconButton(
                        icon: const Icon(Icons.remove_red_eye, color: Colors.white,),
                        iconSize: 18,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications, color: Colors.white,)
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Tổng số dư", style: TextStyle(fontSize: 12, color: Colors.white54),),
                  Tooltip(
                    key: _tooltipKey,
                    message: "Được tính dựa trên số dư của các ví nằm trong tổng",
                      child: IconButton(
                        onPressed: () {
                          final dynamic tooltip = _tooltipKey.currentState;
                          tooltip.ensureTooltipVisible();
                        },
                        icon: Icon(Icons.help,),
                        iconSize: 14,
                      ),
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text("Ví của tôi", textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 267.7),
                            child: TextButton(onPressed: () {},
                                child: const Text("Xem tất cả", style: TextStyle(color: Colors.green),)
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 10, bottom: 8),
                        child: Container(
                          height: 1,
                          color: Colors.white54,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row (
                              children: [
                                Image.asset(
                                  'assets/tienmat.png',
                                  width: 36,
                                ),
                                Text("     Tiền mặt", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            Text("$totalMoney $symbol", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Báo cáo chi tiêu", style: TextStyle(color: Colors.white54),),
                        Padding(
                          padding: const EdgeInsets.only(left: 254),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Xem báo cáo", style: TextStyle(color: Colors.green),),
                          ),
                        )
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Tuần', style: TextStyle(color: Colors.white54),)
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Tháng', style: TextStyle(color: Colors.white54),)
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text("$totalChi $symbol", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            ),
                            const Row(
                              children: [
                                Text("Tổng chi tuần này ", style: TextStyle(color: Colors.white54),),
                                Text("- 0%", style: TextStyle(color: Colors.yellow),)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(36.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.white,
                                          width: 1
                                        )
                                      )
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Tuần trước", style: TextStyle(color: Colors.grey),),
                                        Text("Tuần này", style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Text("Chi tiêu nhiều nhất", style: TextStyle(color: Colors.grey),),
                            const Center(child: Padding(
                              padding: EdgeInsets.only(top: 18, bottom: 18),
                              child: Text("Các khoản chi tiêu sẽ được hiển thị tại đây",),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Giao dịch gần đây", style: TextStyle(color: Colors.white54),),
                        TextButton(
                            onPressed: () {},
                            child: Text("Xem tất cả", style: TextStyle(color: Colors.green),)
                        )
                      ],
                    ),
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.trending_down, color: Colors.red,),
                                Text("Tổng số tiền chi", style: TextStyle(color: Colors.white),),
                                Text("$totalChi $symbol", style: TextStyle(color: Colors.red),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.trending_up, color: Colors.green,),
                                Text("Tổng số tiền thu", style: TextStyle(color: Colors.white),),
                                Text("$totalThu $symbol", style: TextStyle(color: Colors.green),)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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
                    setState(() {
                      symbolData = symbol;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewTransaction(symbol: symbolData))
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
                  setState(() {
                    symbolData = symbol;
                    imgData = img;
                    nameData = name;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Person(symbol: symbolData, img: imgData, name: nameData)
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

