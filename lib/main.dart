import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;
  var sum = 3;
  var text = '';

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      sum = leftDiceNumber + rightDiceNumber;
      text = 'You rolled a $sum!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: (){
                      changeDiceFace();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png')
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text('$text',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
            ),
          ),
        ),
      ],
    );
  }
}
