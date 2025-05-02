import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Consumer<Global_provider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("My profile"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
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
                                child: Image.network(
                                  "https://imgs.search.brave.com/fpxupnhrUkkEzDzjtpFh1wanBeVxl81r-eRtbN0Weuw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzEwLzk2LzI3LzA4/LzM2MF9GXzEwOTYy/NzA4MDNfcnBlOEhq/a2Z3dGpoWmRZekwx/ejhuRjd4czdyZGJz/clkuanBn",
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "username",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "User email",
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
                                      children: List.generate(3, (index) {
                                        return ListTile(
                                          leading:
                                              const Icon(Icons.shopping_bag),
                                          onTap: () => {},
                                          title: Text('Элемент ${index + 1}'),
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
                                      children: List.generate(3, (index) {
                                        return ListTile(
                                          leading: const Icon(Icons.payment),
                                          onTap: () => {},
                                          title:
                                              Text(paymentChanges[index]),
                                        );
                                      }),
                                    ),
                                    
                                    ExpansionTile(
                                      title: const Text("Promotion codes",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),),
                                      children: List.generate(provider.promotionCodes.length, (index) {
                                        return ListTile(
                                          leading: const Icon(Icons.star),
                                          onTap: () => {},
                                          title: Text(' ${provider.promotionCodes[index]}'),
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
                                      children: List.generate(3, (index) {
                                        return ListTile(
                                          leading: const Icon(Icons.settings),
                                          onTap: () => {},
                                          title: Text(' ${settings[index]}'),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )

                        // Container(
                        //   height: 350,
                        //   width: 500,
                        //   padding: const EdgeInsets.all(8.0),
                        //   color: Colors.blue,
                        //   child: Expanded(child: ListView(
                        //     shrinkWrap: true,
                        //     children: [
                        //       ExpansionTile(
                        //         title: Text("data1"),
                        //         children: List.generate(3, (index) {
                        //           return ListTile(
                        //             leading: const Icon(Icons.circle),
                        //             title: Text('Элемент ${index + 1}'),
                        //             onTap: () {
                        //               // Энд дарах үйлдэл оруулж болно
                        //             },
                        //           );
                        //         }),
                        //       ),
                        //     ],
                        //   ),)
                        // )
// ListView.builder(
//                           itemCount: 5,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               padding: const EdgeInsets.all(10),
//                               color: Colors.amber,
//                               child: const ListTile(title:  Text("utga")),
//                             );
//                           },
//                         ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      );
    });
  }
}
