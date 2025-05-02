import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Global_provider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 208, 229, 238),
                  Color.fromARGB(255, 2, 251, 251),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Нэвтрэх хэсэг",
                    style: TextStyle(color: Colors.black, fontSize: 55),
                  ),
                  const Text(
                    "Та өөрийн нэвтрэх нэр нууц үгээ оруулна уу!!",
                    style: TextStyle(fontSize: 35),
                  ),
                  Container(
                    margin: const EdgeInsets.all(50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: TextFormField(
                              controller: _usernameController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(13),
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Нэвтрэх нэр',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Нэвтрэх нэрээ оруулна уу!";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            child: TextFormField(
                              controller: _passwordController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Нууц үг',
                                prefixIcon: Icon(Icons.key),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Та нууц үгээ оруулна уу!! ';
                                } else if (value.length < 6) {
                                  return 'Нууц үг нь 6 - н тэмдэгтээс дээш байх ёстой.!!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Хэрэв та бүртгэлгүй бол"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const SignupScreen(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle:const  TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  child: const Text("бүртгэл үүсгэх"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // bool isLoggedIn = provider.checkLogin(
                          //   _usernameController.text.trim(),
                          //   _passwordController.text.trim(),
                          // );
                          // if (isLoggedIn) {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => ExampleDragAndDrop(),
                          //     ),
                          //   );
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //         'Нэвтрэх нэр эсвэл нууц үг буруу байна!',
                          //       ),
                          //     ),
                          //   );
                          // }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        backgroundColor: const Color.fromARGB(255, 9, 241, 164),
                        shadowColor: Colors.black,
                        elevation: 10,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
