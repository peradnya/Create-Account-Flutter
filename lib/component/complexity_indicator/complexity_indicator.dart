import 'package:flutter/material.dart';

enum ComplexityState { EMPTY, VERY_WEAK, WEAK, MEDIUM, STRONG, VERY_STRONG }

class ComplexityIndicator extends StatelessWidget {
  final ComplexityState complexity;

  const ComplexityIndicator({Key key, this.complexity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    Color color = Colors.red;

    switch (complexity) {
      case ComplexityState.EMPTY:
        name = '';
        color = Colors.red;
        break;
      case ComplexityState.VERY_WEAK:
        name = 'Very Weak';
        color = Colors.red;
        break;
      case ComplexityState.WEAK:
        name = 'Weak';
        color = Colors.orange;
        break;
      case ComplexityState.MEDIUM:
        name = 'Medium';
        color = Colors.yellow;
        break;
      case ComplexityState.STRONG:
        name = 'Strong';
        color = Colors.lightGreen;
        break;
      case ComplexityState.VERY_STRONG:
        name = 'Very Strong';
        color = Colors.lightGreen;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: 'Complexity:  '),
            TextSpan(
              text: name,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
