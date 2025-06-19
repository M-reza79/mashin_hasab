import 'package:flutter/material.dart';
import 'package:mashin_hasab/constants/coler.dart';
import 'package:math_expressions/math_expressions.dart';

 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              color: backgroundGreyDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      inputs,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: textGreen),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      outputs,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 62,
                          color: textGrey),
                    ),
                  ),
                ],
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Container(
              color: backgroundGrey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    kibord('ac', 'ce', '%', '/'),
                    kibord('7', '8', '9', '*'),
                    kibord('4', '5', '6', '-'),
                    kibord('1', '2', '3', '+'),
                    kibord('00', '0', '.', '='),
                  ]),
            ),
            flex: 7,
          ),
        ]),
      ),
    );
  }

  Widget kibord(String text1, String text2, String text3, String text4) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TextButton(
        style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getbagrandColor(text1)),
        onPressed: () {
          buttopressed(text1);
        },
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            text1,
            style: TextStyle(fontSize: 26, color: getforgrandColor(text1)),
          ),
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getbagrandColor(text2)),
        onPressed: () {
          buttopressed(text2);
        },
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            text2,
            style: TextStyle(fontSize: 26, color: getforgrandColor(text2)),
          ),
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getbagrandColor(text3)),
        onPressed: () {
          buttopressed(text3);
        },
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            text3,
            style: TextStyle(fontSize: 26, color: getforgrandColor(text3)),
          ),
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getbagrandColor(text4)),
        onPressed: () {
          buttopressed(text4);
        },
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Text(
            text4,
            style: TextStyle(fontSize: 26, color: getforgrandColor(text4)),
          ),
        ),
      ),
    ]);
  }

  bool is0pertot(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getbagrandColor(String text) {
    if (is0pertot(text)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getforgrandColor(String text) {
    if (is0pertot(text)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }

  var inputs = '';
  var outputs = '';
  void buttopressed(String text) {
    setState(() {
      if (text == 'ac') {
        inputs = '';
        outputs = '';
      } else if (text == 'ce') {
        if (inputs.length > 0) {
          inputs = inputs.substring(0, inputs.length - 1);
        }
      } else if (text == '=') {
        Parser parser = Parser();
        Expression expression = parser.parse(inputs);
        ContextModel contextModel = ContextModel();
        double eval = expression.evaluate(EvaluationType.REAL, contextModel);
        outputs = eval.toString();
        inputs = outputs;
      } else {
        inputs = inputs + text;
      }
    });
  }
}
