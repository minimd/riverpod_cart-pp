import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

//this file is a wholesome example of what we have done.. let me explain
//this whole file is about the shopping bag logo up in the right corner
//whenever you click add item. there is no event listener that is triggered..
//instead. the provider value changes.. and as we have a champion consumer widget instead of a nor

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOdItems = ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 231, 39, 39),
            ),
            child: Text(numberOdItems.toString(), style: const TextStyle(color: Colors.white) ,),
          ),
        ),
      ],
    );
  }
}
