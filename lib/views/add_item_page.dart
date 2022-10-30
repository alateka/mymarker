import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../tools/market_storage.dart';
import '../models/cart_item.dart';
import '../models/food_list.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key, required this.storage, required this.cart});

  final MarketStorage storage;
  final List<CartItem> cart;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Añade un alimento a la lista'),
      ),
      body: Container(
        padding: const EdgeInsets.all(13.0),
        child: DropdownSearch<String>(
          popupProps: const PopupProps.menu(
              showSearchBox: true
          ),
          items: food,
          dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  labelText: '¿Que quieres comprar?',
                  hintText: 'Escribe el producto (Ej: Leche, Huevos, etc)',
              ),
          ),
          onChanged: (value) {
            _writeLog(value!, cart);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
  Future<File> _writeLog(String name, List<CartItem> cart) async {
    cart.add(CartItem(name));
    return storage.rewriteFile(cart);
  }
}