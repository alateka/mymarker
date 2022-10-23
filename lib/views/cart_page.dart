import 'package:flutter/material.dart';

import '../tools/market_storage.dart';
import '../models/cart_item.dart';
import '../views/item_container.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cart, required this.storage});

  final List<CartItem> cart;
  final MarketStorage storage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
         image: Image.asset('assets/background_blur.jpg').image,
         fit: BoxFit.cover
        )
      ),
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          return itemContainer(cart[index].description, cart[index].hour, index, cart, storage);
        }
      ),
    );
  }
}