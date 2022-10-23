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

    final descriptionField = TextEditingController();
    final hourField = TextEditingController();

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
              controller: descriptionField,
              decoration: const InputDecoration(  
                icon: Icon(Icons.menu_book),  
                hintText: 'Introduce una descripción',  
                labelText: 'Descripción',  
              ),  
            ),  
            TextFormField(
              controller: hourField,
              decoration: const InputDecoration(  
                icon: Icon(Icons.alarm),  
                hintText: 'Introduce el número de horas',  
                labelText: 'Horas',  
              ),  
            ), 
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: ElevatedButton(  
                onPressed: () {
                  _writeLog(descriptionField.text, hourField.text, cart);
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
  Future<File> _writeLog(String description, String hour, List<CartItem> cart) async {
    cart.add(CartItem(description, hour));
    return storage.rewriteFile(cart);
  }
}