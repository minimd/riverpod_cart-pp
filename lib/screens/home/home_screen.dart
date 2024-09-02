import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

//here.. our champion ConsumerWidget is called instead of stateLessWidget so we can consume our beloved productsProvider
//you can look for product provider in products_provider.dart| you can see that productProvider is a simple variable with the type of provider.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  // here. we add WidgetRef ref as a second parameter to use the provider
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the products from the ProductsProvider.
    // ref.watch is a method provided by Riverpod that allows you to access the data from the provider and watch for changes.
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
//all set honey. now in the current widget you have the list that you made in that file.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  Text(allProducts[index].title),
                  Text('\$${allProducts[index].price}'),
                  //here we are using the cartNotifierProvider to add and remove products from the cart.
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(onPressed: () { ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(allProducts[index]);}, child: const Text('Remove')),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          // add the product to the cart using the cartNotifierProvider
                          // read nigga. read!!!!
                          //if we want to reach a provider and add data to it we have to use ref.something
                          //then the class name. then notifier if it a notifierProvider, then the function inside that notifier
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(allProducts[index]);
                        },
                        child: const Text('Add')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
