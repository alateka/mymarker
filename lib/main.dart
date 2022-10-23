import 'package:flutter/material.dart';
import './models/cart_item.dart';

import 'views/start.dart';
import 'tools/market_storage.dart';

void main() {
  runApp(MyMarker());
}

class MyMarker extends StatelessWidget {
  MyMarker({super.key});


  final List<CartItem> cart = [];
  final MarketStorage storage = MarketStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMarker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green
      ),
      // darkTheme: ThemeData.dark(),
      home: Start(storage: storage, cart: cart)
    );
  }
}