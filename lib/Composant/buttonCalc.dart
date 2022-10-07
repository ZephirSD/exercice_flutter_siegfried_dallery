import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  final String valueButton;
  final void Function() funcCal;
  final int flex;
  ButtonCalc(this.valueButton, {this.funcCal = _funcCal, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: TextButton(
          onPressed: () {
            funcCal();
          },
          child: Text(
            valueButton,
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
        ),
      ),
    );
  }
}

dynamic _funcCal() {}
