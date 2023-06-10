import 'dart:io';

import 'package:flutter/material.dart';
import '../tools/market_storage.dart';
import '../models/cart_item.dart';

class AddItemPage extends StatelessWidget {
  AddItemPage({super.key, required this.storage, required this.cart});

  final MarketStorage storage;
  final List<CartItem> cart;
  final formKey = GlobalKey<FormState>();
  final itemNameField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Añade un alimento a la lista'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsetsDirectional.all(15.0),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  _writeLog(itemNameField.text, cart);
                  Navigator.pop(context);
                },
                controller: itemNameField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.shopping_cart),
                  hintText: 'Ej: Leche, Huevos, Jabón, etc',
                  labelText: 'Nombre del producto',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.all(15.0),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 55, 145, 43),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(100)),
                onPressed: () {
                  _writeLog(itemNameField.text, cart);
                  Navigator.pop(context);
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> _writeLog(String name, List<CartItem> cart) async {
    cart.add(CartItem(name));
    return storage.rewriteFile(cart);
  }
}
