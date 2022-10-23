import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../tools/market_storage.dart';
import 'add_item_page.dart';
import 'cart_page.dart';

class Start extends StatefulWidget {
  const Start({super.key, required this.storage, required this.cart});

  @override
  State<Start> createState() => _StartState();

  final List<CartItem> cart;
  final MarketStorage storage;
}

class _StartState extends State<Start> {

  @override
  void initState() {
    super.initState();
      
    widget.storage.readFile().then((dataFile) {
      for (var item in jsonDecode(dataFile)) {
        widget.cart.add(CartItem.fromJson(item));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MyMarker"),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Sobre la APP"),
                ),
              ];
            },
            onSelected: (value) {
              if( value == 0 ) {
                // About
              }
            })
          ],
        ),
        body: CartPage(
          storage: widget.storage,
          cart: widget.cart
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 189, 255, 169)),
              borderRadius: BorderRadius.circular(100)),
          onPressed: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => AddItemPage(
                storage: widget.storage,
                cart: widget.cart)
              ))
            .then((value){setState(() {});}),
          child: const Icon(Icons.add),
        ), 
      );
  }
}