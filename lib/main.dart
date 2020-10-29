import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  // Stateful widgets are use when you expect to change state in the page
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // defining how my page's state should change
  int leftDiceNumber = 1; // left dice number initially 1
  int rightDiceNumber = 1; // right dice number initially 2
  void randomizeDice() // function randomizeDice, to randomize a dice's number
  {
    setState(() {
      // calling the setState function(really helpful because it calls the build method when state is changed)
      leftDiceNumber = 1 +
          Random().nextInt(6); // invoking Random().nextInt() from dart:math lib
      rightDiceNumber = 1 +
          Random().nextInt(6); // invoking Random().nextInt() from dart:math lib
    });
  }

  @override
  Widget build(BuildContext context) {
    // my build method
    return Center(
      // Center widget to center the row
      child: Row(
        // Row widget to arrange dices in a row
        mainAxisAlignment: MainAxisAlignment
            .center, // setting my row's main axis(i.e horizontal axis to be center)
        children: [
          // Row's children:
          Expanded(
              // using an Expanded widget to ensure it's child is within the screen
              child: TextButton(
            // using a TextButton Widget
            onPressed:
                () // setting its onPressed data field(i.e a void callback)
                {
              randomizeDice(); // invoking my randomizeDice function
            },
            child: Image.asset(
                'images/dice$leftDiceNumber.png'), // setting child of my button to be the image + a interpolated string of random number
          )),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    randomizeDice();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'))),
        ],
      ),
    );
  }
}
