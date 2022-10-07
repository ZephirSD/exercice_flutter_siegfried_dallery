import 'package:flutter/material.dart';

import 'Composant/buttonCalc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeCalc(),
    );
  }
}

class HomeCalc extends StatefulWidget {
  HomeCalc({Key? key}) : super(key: key);
  @override
  State<HomeCalc> createState() => _HomeCalcState();
}

class _HomeCalcState extends State<HomeCalc> {
  int premierNb = 0;
  int secondNb = 0;
  int total = 0;
  String operation = "";
  String textCalc = "";
  clickNombre(textValue) {
    setState(() {
      textCalc = textValue;
      if (operation != "") {
        secondNb = int.parse(textCalc);
        // print('second${secondNb}');
      } else {
        premierNb = int.parse(textCalc);
        // print('premier${premierNb}');
      }
    });
  }

  clickOperator(textValue) {
    setState(() {
      if (textValue != "=") {
        operation = textValue;
      }
      if (textValue == "=" && operation == "+") {
        total = (premierNb + secondNb);
      } else if (textValue == "=" && operation == "-") {
        total = (premierNb - secondNb);
      } else if (textValue == "=" && operation == "*") {
        total = (premierNb * secondNb);
      } else if (textValue == "=" && operation == "/") {
        total = (premierNb / secondNb) as int;
      }
      if (total > 0) {
        textCalc = total.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonCalc(
                "0",
                funcCal: () => clickNombre("0"),
                flex: 2,
              ),
              ButtonCalc(
                ",",
                funcCal: () => clickNombre(","),
              ),
              ButtonCalc(
                "=",
                funcCal: () => clickOperator("="),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonCalc(
                "1",
                funcCal: () => clickNombre("1"),
              ),
              ButtonCalc(
                "2",
                funcCal: () => clickNombre("2"),
              ),
              ButtonCalc(
                "3",
                funcCal: () => clickNombre("3"),
              ),
              ButtonCalc(
                "+",
                funcCal: () => clickOperator("+"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonCalc(
                "4",
                funcCal: () => clickNombre("4"),
              ),
              ButtonCalc(
                "5",
                funcCal: () => clickNombre("5"),
              ),
              ButtonCalc(
                "6",
                funcCal: () => clickNombre("6"),
              ),
              ButtonCalc(
                "-",
                funcCal: () => clickOperator("-"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonCalc(
                "7",
                funcCal: () => clickNombre("7"),
              ),
              ButtonCalc(
                "8",
                funcCal: () => clickNombre("8"),
              ),
              ButtonCalc(
                "9",
                funcCal: () => clickNombre("9"),
              ),
              ButtonCalc(
                "*",
                funcCal: () => clickOperator("*"),
              ),
            ],
          ),
          Container(
            child: Text(
              textCalc,
              style: TextStyle(fontSize: 28),
            ),
            alignment: Alignment(1.0, 1.0),
          ),
        ],
      ),
    );
  }
}
