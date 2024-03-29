import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/cart_item.dart';
import '../../tools/market_storage.dart';
import '../add_item_page.dart';
import '../../tools/auto_icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> cart = [];
  final MarketStorage storage = MarketStorage();

  @override
  void initState() {
    super.initState();

    storage.readFile().then(
      (dataFile) {
        if (dataFile.isNotEmpty) {
          for (var item in jsonDecode(dataFile)) {
            setState(() {
              cart.add(CartItem.fromJson(item));
            });
          }
        }
      },
    );
  }

  void deleteItem(int id) {
    setState(() {
      cart.removeAt(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(9, 13, 9, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 55, 145, 43),
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 11,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(19),
                ),
                margin: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: ListTile(
                  leading: SvgPicture.asset(
                    autoIcon(cart[index].name),
                    width: 39,
                    height: 39,
                  ),
                  title: Text(cart[index].name,
                      style: const TextStyle(color: Colors.white)),
                  trailing: PopupMenuButton<int>(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('Eliminar'),
                        )
                      ];
                    },
                    onSelected: (int value) {
                      if (value == 1) {
                        deleteItem(index);
                        writeChanges(storage, cart);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 55, 145, 43),
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 5,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(100)),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddItemPage(storage: storage, cart: cart))).then((value) {
          setState(() {});
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<File> writeChanges(MarketStorage storage, List<CartItem> cart) async {
    return storage.rewriteFile(cart);
  }
}
