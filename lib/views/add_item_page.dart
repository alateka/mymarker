import 'dart:io';

import 'package:flutter/material.dart';
import '../tools/market_storage.dart';
import '../models/cart_item.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key, required this.storage, required this.cart});

  final MarketStorage storage;
  final List<CartItem> cart;

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    final nameField = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Añadir hora"),
      ),
      body: Form(  
        key: formKey,  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TextFormField(
              controller: nameField,
              decoration: const InputDecoration(  
                icon: Icon(Icons.menu_book),  
                hintText: 'Escribe el producto (Ej: Leche, Huevos, etc)',  
                labelText: '¿Que quieres comprar?',  
              ),  
            ),   
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: ElevatedButton(  
                onPressed: () {
                  _writeLog(nameField.text, cart);
                  Navigator.pop(context);
                },
                child: const Text('Añadir'),
              )
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