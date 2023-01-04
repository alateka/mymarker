import 'package:flutter/material.dart';

import 'package:mymarker/views/cart_page.dart';

void main() {
  runApp(const MyMarker());
}

class MyMarker extends StatelessWidget {
  const MyMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyMarker',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
        ),
        // darkTheme: ThemeData.dark(),
        home: const CartPage());
  }
}
