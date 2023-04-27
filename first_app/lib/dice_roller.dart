import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  
  @override
  State<DiceRoller> createState(){
    return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller>{
  var currentDiceRoller = 2;
  void rollDice(){
    setState(() {
      currentDiceRoller = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('./assets/images/dice-$currentDiceRoller.png', width: 200),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: rollDice,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 16, right: 20, bottom: 16, left: 20),
                    foregroundColor: Colors.white, 
                    textStyle: const TextStyle(
                      fontSize: 28,
                    )),
                  child: const Text("Roll Dice"),
                )
              ],
            );
  }
}