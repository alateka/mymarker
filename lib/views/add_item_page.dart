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
      body: Container(
        padding: const EdgeInsets.all(13.0),
        child: Form(  
          key: formKey,  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  
            children: <Widget>[  
              TextFormField(
                controller: nameField,
                decoration: const InputDecoration(  
                  icon: Icon(Icons.fastfood),  
                  hintText: 'Escribe el producto (Ej: Leche, Huevos, etc)',  
                  labelText: '¿Que quieres comprar?',  
                ),  
              )
            ],
          ),  
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 55, 145, 43),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 5,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(100)
        ),
        onPressed: () {
          _writeLog(nameField.text, cart);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      )
    );
  }
  Future<File> _writeLog(String name, List<CartItem> cart) async {
    cart.add(CartItem(name));
    return storage.rewriteFile(cart);
  }
}