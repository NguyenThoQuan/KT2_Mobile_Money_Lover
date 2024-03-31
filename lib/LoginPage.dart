import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          itemExtent: 70.0,
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  padding: const EdgeInsets.all(6),
                  child: const Text("Tên đăng nhập", style: TextStyle(fontSize: 20),),
                ),
                Expanded(child: TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nhập vào tên đăng nhập',
                  ),))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  padding: const EdgeInsets.all(6),
                  child: const Text("Mật khẩu", style: TextStyle(fontSize: 20),),
                ),
                Expanded(child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nhập vào mật khẩu',
                  ),))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('username', userNameController.text).then((value) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    });
                  },
                  child: const Text('Đăng nhập'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text("Đăng ký", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
