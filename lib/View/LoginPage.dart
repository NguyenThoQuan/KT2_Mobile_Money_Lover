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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const Text("Đăng nhập", style: TextStyle(fontSize: 25)),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 80),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/facebook.jpg',
                                width: 18,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text("KẾT NỐI VỚI FACEBOOK", style: TextStyle(color: Colors.blueAccent,),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 80),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/google.jpg',
                                width: 18,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 36),
                                child: Text("KẾT NỐI VỚI GOOGLE", style: TextStyle(color: Colors.redAccent,),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 80),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/apple.jpg',
                                width: 18,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 31),
                                child: Text("ĐĂNG NHẬP VỚI APPLE", style: TextStyle(color: Colors.black,),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 80),
                      child: Text(
                        "Chúng tôi sẽ không đăng thông tin mà bạn không có sự cho phép của bạn.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Container(
                            height: 1,
                            color: Colors.white54,
                          ),
                        ),
                        const Center(
                          child: Card(
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                                child: Text("HOẶC", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54),),
                              )
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: TextField(
                                controller: userNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: TextField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Mật khẩu',
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 420,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )
                          ),
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', userNameController.text).then((value) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => HomePage(symbol: 'VND', img: 'assets/vn.jpg', name: 'Việt Nam',))
                              );
                            });
                          },
                          child: const Text('ĐĂNG NHẬP', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/register");
                            },
                            child: const Text("Đăng ký", style: TextStyle(color: Colors.green),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 260),
                            child: InkWell(
                              onTap: () {},
                              child: Text('Quên mật khẩu?', style: TextStyle(color: Colors.green),),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
