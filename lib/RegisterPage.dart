import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<RegisterPage> {
  // bool _onTapLabelText = false;
  // bool _showPassWord = false;

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text("Đăng ký", style: TextStyle(fontSize: 25)),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                )
                              ),
                              child: const Text('ĐĂNG KÝ', style: TextStyle(color: Colors.white),)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: const Text("Đăng nhập", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                        ),
                      ),
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