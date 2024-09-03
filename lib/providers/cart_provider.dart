

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'cart_provider.g.dart';

//notifier stuff.. Notifier is a generic class that has a lot of things.
//Set is a list without any duplicates. Product is a class from the product.dart file.

@riverpod
class CartNotifier extends _$CartNotifier {
//initial state
//
// this overriding the build method of the Notifier class. it changes the build method of the Notifier class to return a Set of Product.

  @override
  Set<Product> build() {
    return const {};
  }

  void addProduct(Product product) {
    //this if check if the state(the cart items) already contains the product. if not, it adds the product to the state.
    if (!state.contains(product)) {
      //if thie statement is met. i want the state to be updated.. the state now should be the old state + the new product.
      //seems like the word state is a preDefined term in flutter that refers to the current state of the widget.
      state = {...state, product};
    }

    //by this happening, any widget that uses this cartNotifierProvider will get updated with the new state.
    // the build method will be executed again.. and the state will be updated with the new product.
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      //notice the beuty of the code here. i am creating a new set by filtering out the product that was removed.
      //state as we mentiond is a 'Set' of products. hence the toSet() method converts the ITERABLE back to a set.
      state = state.where((x) => x.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}
// i had an error here. i didnt 'return anything.. while the build method was expected to return a set of products

// here is our champion that we was building this whole time.. it is a final that is notifier provider.. which we surely want..
// it is of type CartNotifier and returns a Set of Product.. awesome
// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });




//// before making this a generated notifier.. it looked like this 
///import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:riverpod_files/models/product.dart';

// //notifier stuff.. Notifier is a generic class that has a lot of things.
// //Set is a list without any duplicates. Product is a class from the product.dart file.
// class CartNotifier extends Notifier<Set<Product>> {
// //initial state
// //
// // this overriding the build method of the Notifier class. it changes the build method of the Notifier class to return a Set of Product.

//   @override
//   Set<Product> build() {
//     return const {
//       Product(
//           id: '4',
//           title: 'Red Backpack',
//           price: 14,
//           image: 'assets/products/backpack.png'),
//     };
//   }

//   void addProduct(Product product) {
//     //this if check if the state(the card items) already contains the product. if not, it adds the product to the state.
//     if (!state.contains(product)) {
//       //if thie statement is met. i want the state to be updated.. the state now should be the old state + the new product.
//       //seems like the word state is a preDefined term in flutter that refers to the current state of the widget.
//       state = {...state, product};
//     }
   
//     //by this happening, any widget that uses this cartNotifierProvider will get updated with the new state.
//     // the build method will be executed again.. and the state will be updated with the new product.
//   }
//    void removeProduct(Product product) {
//       if (state.contains(product)) {
//         //notice the beuty of the code here. i am creating a new set by filtering out the product that was removed.
//         //state as we mentiond is a 'Set' of products. hence the toSet() method converts the ITERABLE back to a set.
//         state = state.where((p)=>p.id!= product.id).toSet();
//       }
//     }
// }
// // i had an error here. i didnt 'return anything.. while the build method was expected to return a set of products

// // here is our champion that we was building this whole time.. it is a final that is notifier provider.. which we surely want..
// // it is of type CartNotifier and returns a Set of Product.. awesome
// // final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
// //   return CartNotifier();
// // });


