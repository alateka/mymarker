import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de MyMarker'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: const Text(
          'MyMarker es una aplicación dedicada a la gestión de tu compra del día a día',
          style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
