import 'package:flutter/material.dart';

import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class AmountPage extends StatelessWidget {
  const AmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
            child: const SimpleCalculator(
              hideExpression: true,
              theme: CalculatorThemeData(
                displayColor: Colors.white,
                displayStyle: TextStyle(fontSize: 80, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
