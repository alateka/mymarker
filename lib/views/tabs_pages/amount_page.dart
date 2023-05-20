import 'package:flutter/material.dart';

class AmountPage extends StatelessWidget {
  const AmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 33, 33, 133),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(19),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              'Importe total',
              style: TextStyle(
                letterSpacing: 0.5,
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
