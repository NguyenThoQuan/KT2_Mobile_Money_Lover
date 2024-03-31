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
  String username = "";

  Future<void> loadData() async {
    final prefs = SharedPreferences.getInstance().then((value) {
      setState(() {
        username = value.getString('username')!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    return Scaffold(
        appBar: AppBar(
            title: const Text("Cửa hàng")
        ),
        body: Center(
          child: Text("Xin chào bạn $username đã trở lại"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Phần đầu ngăn kéo'),
              ),
              ListTile(
                title: const Text('Mục 1'),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Mục 2'),
                onTap: () {

                },
              ),
            ],
          ),
        )
    );
  }
}
