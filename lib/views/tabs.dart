import 'package:flutter/material.dart';
import 'package:mymarker/views/about_page.dart';
import 'package:mymarker/views/tabs_pages/amount_page.dart';
import 'package:mymarker/views/tabs_pages/cart_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MyMarker"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Sobre la APP"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                }
              },
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            tabs: [
              Tab(icon: Icon(Icons.shopping_cart_rounded), text: "Carrito"),
              Tab(icon: Icon(Icons.calculate_rounded), text: "Calculadora")
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CartPage(),
            AmountPage(),
          ],
        ),
      ),
    );
  }
}
