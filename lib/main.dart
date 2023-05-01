import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:audioplayers/audio_cache.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  AudioCache audioCache = AudioCache();

  void initState() {
    super.initState();
    audioCache.load('dice_roll.mp3');
  }

  void playSound() async {
    audioCache.play('dice_roll.mp3');
  }

  void rollDice() {
    playSound();
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
        backgroundColor: Color.fromARGB(255, 83, 15, 15),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Dice Roll Game!',
            style: GoogleFonts.lobster(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onDoubleTap: rollDice,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: rollDice,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              rollDice();
            },
            child: Text(
              'Roll Dice',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary:
                  Color.fromARGB(255, 97, 29, 29), // set the background color
            ),
          ),
        ],
      ),
    );
  }
}
