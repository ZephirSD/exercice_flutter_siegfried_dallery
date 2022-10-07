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

  // Fonction pour récupérer les nombres de la calculatrice
  clickNombre(String textValue) {
    setState(() {
      textCalc = textValue;
      if (operation != "") {
        if (total > 0) {
          premierNb = total;
          secondNb = int.parse(textCalc);
        } else {
          secondNb = int.parse(textCalc);
        }
      } else {
        premierNb = int.parse(textCalc);
      }
    });
  }

  //Fonction pour ajouter les initier les opérateurs et les calculs
  clickOperator(textValue) {
    setState(() {
      if (textValue != "=") {
        operation = textValue;
      }
      // Condition pour les opérations
      if (textValue == "=" && operation == "+") {
        total = (premierNb + secondNb);
      } else if (textValue == "=" && operation == "-") {
        // Lorsque les deux nombres sont identiques
        if (secondNb == premierNb) {
          textCalc = "0";
          secondNb = 0;
          premierNb = 0;
        } else {
          total = (premierNb - secondNb);
        }
      } else if (textValue == "=" && operation == "*") {
        total = (premierNb * secondNb);
      } else if (textValue == "=" && operation == "/") {
        // Lorsqu'on divise par zero
        if (secondNb > 0) {
          total = (premierNb / secondNb) as int;
        } else {
          textCalc = "Erreur";
          total = 0;
        }
      }
      // Condition lorsqu'on clique sur "AC"
      if (textValue == "AC") {
        premierNb = 0;
        secondNb = 0;
        total = 0;
        textCalc = "";
        if (operation != "") {
          operation = "";
        }
      }
      if (total > 0) {
        textCalc = total.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Boutons de la calculatrice
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonCalc(
                "AC",
                funcCal: () => clickOperator("AC"),
                flex: 3,
              ),
              ButtonCalc(
                "/",
                funcCal: () => clickOperator("/"),
              ),
            ],
          ),
          // Affichage du résultat
          Container(
            child: Text(
              textCalc,
              style: TextStyle(fontSize: 34),
            ),
            alignment: Alignment(1.0, 1.0),
          ),
        ],
      ),
    );
  }
}
