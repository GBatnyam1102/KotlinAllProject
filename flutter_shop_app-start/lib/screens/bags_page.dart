import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/product_detail.dart';

// ignore: must_be_immutable
class BagsPage extends StatelessWidget {
  void _onTap(BuildContext context, ProductModel data) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Product_detail(data)));
  }

  const BagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Global_provider>(builder: (context, provider, child) {
      double total = provider.cartItems
          .fold(0, (sum, item) => sum + (provider.resultCalc(item)));
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: provider.cartItems.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = provider.cartItems[index];
            double resTotal = item.count * item.price!;
            return InkWell(
              onTap: () => _onTap(context, item),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  FloatingActionButton.small(
                                    heroTag: 'remove_$index',
                                    onPressed: () {
                                      provider.multiCount(item);
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    item.count.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 16),
                                  FloatingActionButton.small(
                                    heroTag: 'add_$index',
                                    onPressed: () {
                                      provider.addCount(item);
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                  const SizedBox(width: 300),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    provider.deleteItemCart(item);
                                  },
                                  icon: const Icon(Icons.cancel)),
                              Text(
                                "\$${resTotal.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement buy all logic
                  // For example, you might want to navigate to a checkout page
                  // or display a confirmation dialog.
                },
                child: const Text('Buy All'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
