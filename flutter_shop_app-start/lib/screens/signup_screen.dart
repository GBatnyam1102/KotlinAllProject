import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
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
                    "Бүртгэл үүсгэх хэсэг",
                    style: TextStyle(color: Colors.black, fontSize: 55),
                  ),
                  const Text(
                    "Та өөрийн мэдээллийг оруулна уу!!",
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(13),
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.mail),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Өөрийн email-ийг оруулна уу';
                                } else if (!value.contains('@')) {
                                  return 'example@exe.com';
                                }
                                return null;
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
                          const SizedBox(height: 20),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Хэрэв та бүртгэлтэй бол"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  child: const Text("нэвтэрнэ үү"),
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
                          // Customer customer = Customer(
                          //   name: _usernameController.text,
                          //   imageProvider: AssetImage(
                          //     "assets/images/woman1.png",
                          //   ),
                          // );
                          // provider.customers.add(customer);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text("Амжилттай бүртүүллээ!"),
                          //     duration: Duration(seconds: 2),
                          //   ),
                          // );
                          // Navigator.of(context).pop();
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
                        "Sign Up",
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
