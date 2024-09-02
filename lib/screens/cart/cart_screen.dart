import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
// import 'package:riverpod_files/providers/products_provider.dart';

//instead of stateFullWidget..
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  //here we make a new class that we will inherit from
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

//here is our beloved widget with the ability to consume and to render and change
class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final cartTotal = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: false,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
                children: cartProducts.map((product) {
              return Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Image.asset(
                      product.image,
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(product.title),
                    const Expanded(child: SizedBox()),
                    Text('\$${product.price}'),
                  ],
                ),
              );
            }).toList()),
            Text('total - \$$cartTotal')

            // output totals here
          ],
        ),
      ),
    );
  }
}
