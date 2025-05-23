import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/product_detail.dart';
import '../models/product_model.dart';

class ProductViewShop extends StatelessWidget {
  final ProductModel data;

  const ProductViewShop(this.data, {super.key});
  _onTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Product_detail(data)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Global_provider>(builder: (context, provider, child) {
      return InkWell(
          onTap: () => _onTap(context),
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image
                Container(
                  height: 150.0, // Adjust the height based on your design
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.image!),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                // Product details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '\$${data.price!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (provider.islog) {
                                provider.setFavorite(data);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Та хэрэглэгчийн эрхээр нэвтрээгүй байна"),
                                            backgroundColor: Colors.blue,));
                                    
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: provider.islog && data.isFavorite
                                  ? Colors.red // if favorited → red
                                  : Colors.grey, // else → grey
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });

    // Row(
    //   children: [
    //     Box(
    //       height: width /3,
    //       width: width,
    //       margin: EdgeInsets.only(right: 10),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(8),
    //         image: DecorationImage(image: NetworkImage(data.image!), fit: BoxFit.fitHeight)
    //       ),
    //     ),
    //      Column(
    //       children: [
    //         Text(data.title==null?"": data.title!),
    //         Text(data.category==null?"": data.category!),
    //         Text('${data.price}'),
    //       ],
    //     )

    //   ],
    // );
  }
}
