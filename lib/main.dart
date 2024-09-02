import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/screens/home/home_screen.dart';

void main() {
  // we wrapped pur "myApp" with a provider scope so now everything inside MyApp can consume our beloved providers,
  //if you don't want the whole app to reach the provider. wrap only the widgets that you want
  runApp(const ProviderScope(child: MyApp()));
}
// as you see here.. this is an ordinary stateless widget. no provider. no nothing
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 68, 255, 249)),
      ),
      home: const HomeScreen(),
    );
  }
}