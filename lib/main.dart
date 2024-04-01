import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

const Color darkBlue = Colors.black87;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
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
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final GlobalKey _tooltipKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("0 đ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                  IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.white,),
                    iconSize: 18,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 347.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications, color: Colors.white,)
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Tổng số dư", style: TextStyle(fontSize: 12),),
                  Tooltip(
                    key: _tooltipKey,
                      child: IconButton(
                        onPressed: () {
                          final dynamic tooltip = _tooltipKey.currentState;
                          tooltip.ensureTooltipVisible();
                        },
                        icon: Icon(Icons.help,),
                        iconSize: 14,
                      ),
                    message: "Được tính dựa trên số dư của các ví nằm trong tổng",
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Ví của tôi", textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(left: 269.3),
                            child: TextButton(onPressed: () {},
                                child: Text("Xem tất cả", style: TextStyle(color: Colors.green),)
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
                          children: [
                            Image.asset(
                                'assets/tienmat.png',
                              width: 36,
                            ),
                            Text("     Tiền mặt", style: TextStyle(color: Colors.white),),
                            Padding(
                              padding: const EdgeInsets.only(left: 277),
                              child: Text("0 đ", style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

}
