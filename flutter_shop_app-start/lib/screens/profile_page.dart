import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/users.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<UserModel>> _getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/users.json");
    List<UserModel> data = UserModel.fromList(jsonDecode(res));

    // ignore: use_build_context_synchronously
    Provider.of<Global_provider>(context, listen: false).setUsers(data);
    // ignore: use_build_context_synchronously
    return Provider.of<Global_provider>(context, listen: false).users;
  }

  String dropdownValue = 'One';
  List<String> paymentChanges = ["QPay", "Internet Bank", "Mobile Bank"];
  List<String> settings = [
    "Change username",
    "Recovery password",
    "Payment advice",
    "Feedback",
    "About"
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Consumer<Global_provider>(
                builder: (context, provider, child) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("My profile"),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 600, maxHeight: 600),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/woman1.png",
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.username,
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            provider.email,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 50),
                                SizedBox(
                                  height: 350,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView(
                                          children: [
                                            ExpansionTile(
                                              title: const Text(
                                                "My Orders",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              ),
                                              children: List.generate(
                                                  provider.cartItems.length,
                                                  (index) {
                                                return ListTile(
                                                  leading: const Icon(
                                                      Icons.shopping_bag),
                                                  onTap: () => {},
                                                  title: Text(
                                                      ' ${provider.cartItems[index].title}'),
                                                );
                                              }),
                                            ),
                                            ExpansionTile(
                                              title: const Text(
                                                "Payment Methods",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              ),
                                              children:
                                                  List.generate(3, (index) {
                                                return ListTile(
                                                  leading:
                                                      const Icon(Icons.payment),
                                                  onTap: () => {},
                                                  title: Text(
                                                      paymentChanges[index]),
                                                );
                                              }),
                                            ),
                                            ExpansionTile(
                                              title: const Text(
                                                "Promotion codes",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              ),
                                              children: List.generate(
                                                  provider.promotionCodes
                                                      .length, (index) {
                                                return ListTile(
                                                  leading:
                                                      const Icon(Icons.star),
                                                  onTap: () => {},
                                                  title: Text(
                                                      ' ${provider.promotionCodes[index]}'),
                                                );
                                              }),
                                            ),
                                            ExpansionTile(
                                              title: const Text(
                                                "Settings",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              ),
                                              children:
                                                  List.generate(3, (index) {
                                                return ListTile(
                                                  leading: const Icon(
                                                      Icons.settings),
                                                  onTap: () => {},
                                                  title: Text(
                                                      ' ${settings[index]}'),
                                                );
                                              }),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 40,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const LoginScreen()));
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blue,
                                                      ),
                                                      child: const Text(
                                                        "LogIn",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  height: 40,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        if (provider.islog) {
                                                          provider.changeUser(
                                                              "", "");
                                                          provider.favoriteItems
                                                              .clear();
                                                          provider.cartItems
                                                              .clear();
                                                          provider.islog =
                                                              false;
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          "Сиситемээр гарлаа!!!")));
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          "Та нэвтэрээгүй байна!!!")));
                                                        }
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.blue),
                                                      child: const Text(
                                                        "Log out",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              );
            });
          } else {
            return const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              ),
            );
          }
        }));
  }
}
